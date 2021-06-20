//
//  ContentView.swift
//  LoginPageApp
//
//  Created by Nick on 13.06.21.
//

import SwiftUI

struct ContentView: View {

    let storedUsername = "Myusername"
    let storedPassword = "Mypassword"

    @State var userName = ""
    @State var password = ""
    @State var authenticationDidFail = false
    @State var authenticationDidSucceed = false

    var body: some View {
        ZStack {
            VStack {
                WelcomeText()
                UserImage()
                UsernameTextField(userName: $userName)

                PasswordSecureField(password: $password)

                if authenticationDidFail {
                    Text("Entered credentials incorrect. Try again.")
                        .padding(.bottom, 15)
                        .foregroundColor(.red)
                }

                Button(action: {
                    if userName == storedUsername && password == storedPassword {
                        authenticationDidSucceed = true
                        authenticationDidFail = false
                    } else {
                        authenticationDidFail = true
                    }
                }) {
                    LoginButtonContent()
                }



            }
            .padding()
            if authenticationDidSucceed {
                Text("Login successful!")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .animation(Animation.default)
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UserImage: View {
    var body: some View {
        Image("ProfilePicture")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 150)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding(10)
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15)
    }
}

struct UsernameTextField: View {
    @Binding var userName: String

    var body: some View {
        TextField("Username", text: $userName)
            .padding()
            .background(Color("LightGray"))
            .cornerRadius(5)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    @Binding var password: String

    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color("LightGray"))
            .cornerRadius(5)
            .padding(.bottom, 20)
    }
}

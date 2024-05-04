//
//  Login.swift
//  MacOSLogin
//
//  Created by Vladimir Pisarenko on 04.05.2024.
//

import SwiftUI

struct Login: View {
    
    // getting screen frame...
    
    var screen = NSScreen.main?.visibleFrame
    
    //Email and password textfields
    
    @State var email = ""
    @State var password = ""
    @State var keepLogged = false
    
    //Alert
    @State var alert = false
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            VStack {
                
                Spacer(minLength: 0)
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.black)
                    .padding(.vertical, 10)
                
                //Google login
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    
                    HStack {
                        
                        Image(.google)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                        
                        Spacer(minLength: 0)
                        
                        Text("Log in with google")
                            .foregroundStyle(Color.black)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(Color.white)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.vertical)
                
                HStack {
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 1)
                    
                    Text("QR")
                        .foregroundStyle(Color.gray)
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 1)
                }
                
                Group {
                    
                    //Email
                    TextField("Email", text: $email)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(RoundedRectangle(cornerRadius: 2).stroke(Color.gray.opacity(0.7), lineWidth: 1))
                    
                    //Password
                    SecureField("Password", text: $password)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                    //Border
                        .background(RoundedRectangle(cornerRadius: 2).stroke(Color.gray.opacity(0.7), lineWidth: 1))
                        .padding(.top)
                    
                    //Keep login and forget password
                    HStack {
                        
                        Toggle("", isOn: $keepLogged)
                            .labelsHidden()
                            .toggleStyle(CheckboxToggleStyle())
                        Text("Keep toggle in")
                            .foregroundStyle(Color.black)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Forget password")
                                .foregroundStyle(Color.black)
                                .underline(true, color: Color.black)
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    //Login button
                    
                    Button(action: {alert.toggle()}, label: {
                        HStack {
                            Spacer()
                            Text("Login")
                            Spacer()
                            Image(systemName: "arrow.right")
                        }
                        .foregroundStyle(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 2))
                    })
                    .buttonStyle(PlainButtonStyle())
                    .padding(.top)
                    
                    //Sign up
                    
                    HStack {
                        
                        Text("Don't have account yet?")
                            .foregroundStyle(Color.gray)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Sigh up")
                                .foregroundStyle(.blue)
                                .underline(true, color: Color.black)
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.top, 10)
                }
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 50)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            
            VStack {
                
                Spacer()
                
                //Welcome image...
                
                Image("welcome")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                //moving image slightly outside
                    .padding(.leading, -35)
                
                Spacer()
            }
            // half of the width
            .frame(width: (screen!.width / 1.8) / 2)
            .background(Color.lightblue)
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: screen!.width / 1.8, height: screen!.height - 100)
        //Always light mode
        .preferredColorScheme(.light)
        .alert(isPresented: $alert, content: {
            Alert(title: Text("Message"), message: Text("Logged succesfully"), dismissButton: .destructive(Text("Ok")))
        })
    }
}

#Preview {
    Login()
}

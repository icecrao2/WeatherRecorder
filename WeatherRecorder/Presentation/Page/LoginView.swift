//
//  Login.swift
//  WeatherRecorder
//
//  Created by sw on 2023/02/04.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var authManager: LoginViewModel = LoginViewModel()
    
    var body: some View {
        
        VStack {
            
            Text("Weather\nRecorder")
                .font(.title)
                .fontWeight(.heavy)
            
            Spacer(minLength: 0).frame(height: 10)
            
            IconView(isStart: false)
            
            Spacer(minLength: 0).frame(height: 50)
            
            VStack {
                
                VStack{
                    Text("Name")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer(minLength: 0).frame(height: 10)
                    
                    TextField("placeholder", text: $authManager.inputedName)
                        .frame(height: 50)
                        .padding(.horizontal, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 0.2)
                        )
                }
                .padding(.horizontal)
                
                Spacer(minLength: 0).frame(height: 20)
                
                VStack {
                    Text("Password")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer(minLength: 0).frame(height: 10)
                    
                    SecureField("placeholder", text: $authManager.inputedPassword)
                        .frame(height: 50)
                        .padding(.horizontal, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black, lineWidth: 0.2)
                        )
                }
                .padding(.horizontal)
                
                
                Button {
                    authManager.login()
                } label: {
                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                        )
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 8)
                

            }
        }
        .onAppear{
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

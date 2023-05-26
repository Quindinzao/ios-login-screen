//
//  ContentView.swift
//  first_product
//
//  Created by João Victor Fernandes on 18/05/23.
//

import SwiftUI

//  var isAuthenticated: Bool = false

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoginEnabled: Bool = false
    //  @State private var isAuth: Bool = false
    
    var containerWidth: CGFloat = UIScreen.main.bounds.width - 32.0

    var body: some View {
        ZStack {
            Color(red: 245/255, green: 245/255, blue: 245/255).ignoresSafeArea()
            VStack {
                Image(systemName: "swift")
                    .padding(12)
                    .background(Color(red: 200/255, green: 100/255, blue: 250/255))
                    .cornerRadius(28)
                    .foregroundColor(.black)
                    .imageScale(.large)
                
                Text("Swift")
                    .font(.body)
                    .fontWeight(.heavy)

                TextField("E-mail", text: $email)
                    .padding(12)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(radius: 0.5)
                    .disableAutocorrection(true)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .padding(12)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(radius: 0.5)
                    .disableAutocorrection(true)
                    
                Button(action: signIn) {
                    Text("Sign In")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                    .frame(maxWidth: .infinity)
                    .padding(12)
                    .background(
                        isLoginEnabled
                        ? Color(red: 200/255, green: 100/255, blue: 250/255)
                        : Color(red: 200/255, green: 200/255, blue: 200/255)
                    )
                    .cornerRadius(8)
                    .shadow(radius: 0.5)
                    .disabled(!isLoginEnabled)
                    .onReceive([self.email].publisher.first()) {
                        (value) in validateLoginFields()
                    }
                    .onReceive([self.password].publisher.first()) {
                        (value) in validateLoginFields()
                    }
                
                Button(action: {}) {
                    Image(systemName: "key")
                        .foregroundColor(Color(red: 200/255, green: 100/255, blue: 250/255))
                        .fontWeight(.bold)
                    Text("I forgot my password")
                        .foregroundColor(Color(red: 200/255, green: 100/255, blue: 250/255))
                        .fontWeight(.bold)
                }
                    .frame(maxWidth: .infinity)
            }
            .frame(width: containerWidth)
        }
    }
    
    func validateLoginFields() {
        let isEmailValid = isValidEmail(email: email)
        let isPasswordValid = isValidPassword(password: password)
        
        isLoginEnabled = isEmailValid && isPasswordValid
    }
    
    func isValidEmail(email: String) -> Bool {
        // Implemente sua lógica de validação de e-mail aqui
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(password: String) -> Bool {
        // Implemente sua lógica de validação de senha aqui
        return password.count >= 6
    }
    
    func signIn() {
        // Adicione a lógica de autenticação aqui
        print("Autenticando usuário...")
        print("E-mail: \(email)")
        print("Password: \(password)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

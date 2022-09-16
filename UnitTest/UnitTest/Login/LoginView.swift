//
//  LoginView.swift
//  UnitTest
//
//  Created by mike on 2022/9/15.
//

import SwiftUI


/// 登入頁面
struct LoginView: View {
    
    @ObservedObject var viewModel: LoginVerificationViewModel
    
    
    var body: some View {
        VStack {
            TextField("email", text: $viewModel.email)
                .padding()
    
            SecureField("password", text: $viewModel.password)
                .padding()
                .onSubmit(viewModel.login)
               
            Button("login", action: viewModel.login)
                .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                .disabled(viewModel.isLoginDisabled)
            
            
            if let errorText = viewModel.errorText {
                Text(errorText)
                    .foregroundColor(.red)
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .alert(item: $viewModel.alertInfo) { info in
            Alert(title: Text(info.title), message: Text(info.message), dismissButton: .cancel())
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: .init(isAuthorized: false))
    }
}

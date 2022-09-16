//
//  ContentView.swift
//  UnitTest
//
//  Created by mike on 2022/9/12.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = LoginVerificationViewModel(isAuthorized: false)
    
    
    var body: some View {
        
        if viewModel.isAuthorized {
            Text("Hello World!")
                .padding()
        }
        else {
            LoginView(viewModel: viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

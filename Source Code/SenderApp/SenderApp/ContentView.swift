//
//  ContentView.swift
//  SenderApp
//
//  Created by Shady El-Maadawy on 26/12/2023.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var viewModel = SenderViewModel(pipeName: "Hello-World!;")

    var body: some View {
        VStack {
            TextField("Your data:", text: self.$viewModel.dataString)
            Button.init(action: self.viewModel.send, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

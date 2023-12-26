//
//  ContentView.swift
//  ReceiveApp
//
//  Created by Shady El-Maadawy on 26/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var pipeViewModel = PipeViewModel.init(pipeName: "Hello-World!;")

    var body: some View {
        VStack {
            Text("Data: \(pipeViewModel.pipeData)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

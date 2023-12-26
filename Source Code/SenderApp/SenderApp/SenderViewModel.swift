//
//  SenderViewModel.swift
//  SenderApp
//
//  Created by Shady El-Maadawy on 26/12/2023.
//

import Combine

final class SenderViewModel: ObservableObject {
    
    private let pipeSender: PipeSender
    @Published var dataString: String = ""
    
    init(pipeName: String) {
        self.pipeSender = PipeSender(pipeName: pipeName)
    }
    
    func send() {
        guard dataString.count > 0 else {
            return
        }
        pipeSender.send(dataString: dataString)
    }
}

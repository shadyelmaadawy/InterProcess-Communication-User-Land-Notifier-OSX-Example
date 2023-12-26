//
//  PipeViewModel.swift
//  ReceiveApp
//
//  Created by Shady El-Maadawy on 26/12/2023.
//

import Foundation
import Combine

final class PipeViewModel: ObservableObject {
    
    @Published var pipeData: String = ""
    public var subscriptions: Set<AnyCancellable> = {
        return Set<AnyCancellable>()
    }()

    private let pipeServices: PipeReceiver
    
    init(pipeName: String) {
        self.pipeServices = PipeReceiver(pipeName: pipeName)
        bindService()
    }
    
    private func bindService() {
        
        pipeServices.pipeData
            .receive(on: DispatchQueue.main)
            .sink { _ in } receiveValue: { [weak self] pipeBuffer in
                guard let self = self else {
                    return
                }
                pipeData = pipeBuffer
            }
            .store(in: &subscriptions)

    }
    
    deinit {
        subscriptions.forEach{($0.cancel())}
        subscriptions.removeAll()
    }
}


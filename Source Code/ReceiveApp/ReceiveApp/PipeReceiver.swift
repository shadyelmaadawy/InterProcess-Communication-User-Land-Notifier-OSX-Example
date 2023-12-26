//
//  PipeReceiver.swift
//  ReceiveApp
//
//  Created by Shady El-Maadawy on 26/12/2023.
//

import Foundation
import Combine

final class PipeReceiver {
    
    private let pipeURL: URL
    private var pipeHandle: FileHandle? = nil
    
    let pipeData = PassthroughSubject<String, Never>()
    
    init(pipeName: String) {
        self.pipeURL = URL(fileURLWithPath: "/TMP/\(pipeName)")
        self.unBind()
        self.setupNamedPipe()
    }
    
    deinit {
        unBind()
    }
    
    private func setupNamedPipe() {

        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else {
                return
            }
            
            mkfifo(pipeURL.path, S_IRWXU) // MARK: - Execute | Read | Write Permissions

            self.pipeHandle = FileHandle.init(forReadingAtPath: pipeURL.path)!
            self.pipeHandle?.readabilityHandler = { handler in
                
                let pipeData = handler.availableData
                
                guard pipeData.isEmpty == false else {
                    return
                }
                guard let readableData = String.init(data: pipeData, encoding: .utf8) else {
                    return
                }
                self.pipeData.send(readableData)
            }
        }
        
    }
}

private extension PipeReceiver {
    
    func unBind() {
        do { try FileManager.default.removeItem(at: pipeURL)} catch {}
    }
    
}

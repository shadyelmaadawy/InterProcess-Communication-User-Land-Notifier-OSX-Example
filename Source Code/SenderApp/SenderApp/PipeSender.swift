//
//  PipeSender.swift
//  SenderApp
//
//  Created by Shady El-Maadawy on 26/12/2023.
//

import Foundation

final class PipeSender {
    
    private let pipeURL: URL
    private var pipeHandle: FileHandle? = nil
    
    init(pipeName: String) {
        
        self.pipeURL = URL(fileURLWithPath: "/TMP/\(pipeName)")
        self.setupNamedPipe()
        
    }
    
    deinit {
        do { try pipeHandle?.close() } catch {}
    }
    
    private func setupNamedPipe() {

        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else {
                return
            }
            self.pipeHandle = FileHandle.init(forWritingAtPath: pipeURL.path)
        }
        
    }
    
    func send(dataString: String) {
        
        guard dataString.count > 0 else {
            return
        }
        guard let pipeBuffer = dataString.data(using: .utf8) else {
            return
        }
        
        self.pipeHandle?.write(pipeBuffer)
    }
}

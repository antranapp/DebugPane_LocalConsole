//
//  File.swift
//  
//
//  Created by An Tran on 24/3/22.
//

import Foundation
import Logging
import LocalConsole

public struct LocalConsoleLogHandler: LogHandler {
    public var metadata = Logger.Metadata()
    public var logLevel = Logger.Level.info

    private let label: String
    
    public init(_ label: String) {
        self.label = label
    }
    
    public subscript(metadataKey key: String) -> Logger.Metadata.Value? {
        get {
            metadata[key]
        } set(newValue) {
            metadata[key] = newValue
        }
    }

    
    public func log(level: Logger.Level, message: Logger.Message, metadata: Logger.Metadata?, file: String, function: String, line: UInt) {
        var mergedMetadata = self.metadata
        for (key, value) in metadata ?? [:] {
            mergedMetadata[key] = value // Override keys if necessary
        }
        
        LCManager.shared.print(message.description)
    }

}

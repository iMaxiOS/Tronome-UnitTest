//
//  SimplePlayer.swift
//  Raytronome
//
//  Created by Гранченко Максим on 12/26/18.
//  Copyright © 2018 Гранченко Максим. All rights reserved.
//

import AVFoundation
import RxSwift
import RxCocoa

class SimplePlayer: NSObject {
    private var players: [String: AVAudioPlayer] = [:]
    private let bundle: Bundle
    private let session = AVAudioSession.sharedInstance()
    
    init(bundle: Bundle = .main) {
        self.bundle = bundle
    }
    
    func prepare(_ audioFiles: [AudioFileRepresentable],
                 category: AVAudioSession.Category = .soloAmbient) throws {
        for audioFile in audioFiles where players[audioFile.audioFile] == nil {
            guard let ext = audioFile.audioFile.components(separatedBy: ".").last?.lowercased() else {
                throw Error.invalidAudioFile
            }
            
            let fileName = audioFile.audioFile.replacingOccurrences(of: ".\(ext)", with: "")
            
            guard let fileURL = bundle.url(forResource: fileName, withExtension: ext) else {
                throw Error.invalidAudioFile
            }
            
            players[audioFile.audioFile] = try AVAudioPlayer(contentsOf: fileURL)
        }
        
        try session.setCategory(category, mode: .default, options: [])
        try session.setActive(true, options: [])
    }
    
    func play(_ audioFile: AudioFileRepresentable) throws {
        try prepare([audioFile])
        
        guard let player = players[audioFile.audioFile] else {
            fatalError("This should never happen")
        }
        
        player.play()
    }
    
    deinit {
        try! session.setActive(false, options: [])
        players = [:]
    }
}

// MARK: - Errors
extension SimplePlayer {
    enum Error: Swift.Error {
        case invalidAudioFile
    }
}

// MARK: - AudioFileRepresentable protocol
protocol AudioFileRepresentable {
    var audioFile: String { get }
}

// MARK: - Reactive Extension
extension Reactive where Base: SimplePlayer {
    var audioFile: Binder<AudioFileRepresentable> {
        return Binder(base) { player, file in
            do {
                try player.play(file)
            } catch let err {
                fatalError("Player has been bound with an invalid audio file: \(err)")
            }
        }
    }
}

//
//  Beat.swift
//  Raytronome
//
//  Created by Гранченко Максим on 12/26/18.
//  Copyright © 2018 Гранченко Максим. All rights reserved.
//

import class AVFoundation.AVAudioSession

enum Beat: CaseIterable {
    case first
    case regular
}

extension Beat: AudioFileRepresentable {
    var audioFile: String {
        switch self {
        case .first: return "accent.wav"
        case .regular: return "click.wav"
        }
    }
}

extension Beat: Equatable { }

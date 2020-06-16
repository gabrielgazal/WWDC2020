import AVFoundation

class AudioManager{
    static let shared = AudioManager()
    
    private var soundEffects = [SoundEffectLibrary : SoundEffect]()

    private init() {
        SoundEffectLibrary.allCases.forEach( { soundEffects[$0] = SoundEffect(fileName: $0.rawValue) } )
    }
    
    func play(soundEffect: SoundEffectLibrary) {
        soundEffects[soundEffect]?.play()
        
    }

    
}

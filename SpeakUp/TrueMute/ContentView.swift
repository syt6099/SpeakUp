//
//  ContentView.swift
//  TrueMute
//
//  Created by Wilson Shu on 4/12/24.
//  Assisted/Inspired by Sky Liu on 4/9/24.
//
import SwiftUI

struct ContentView: View {
    @State private var isMuted: Bool = VolumeController.isMuted
    
    var body: some View {
        VStack {
            Button(isMuted ? "Unmute" : "Mute") {
                VolumeController.isMuted.toggle()
            }
            .scaledToFit()
            .buttonStyle(.bordered)
            Text("Hotkey is Global. You can minimize or close this window. ")
            Text("The toggle Hot key is Command + Shift + W.")
        }
        .onAppear {
            // Set the closure to update the local state when isMuted changes.
            VolumeController.onMuteStateChanged = { muted in
                isMuted = muted
            }
        }
    }
}


#Preview {
    ContentView()
}

//
//  MacOSLoginApp.swift
//  MacOSLogin
//
//  Created by Vladimir Pisarenko on 03.05.2024.
//

import SwiftUI

@main
struct MacOSLoginApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //Hiding the titlebar
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

//Hiding text field focus ring

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get {.none}
        set {}
    }
}

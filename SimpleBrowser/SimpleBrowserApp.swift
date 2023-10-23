//
//  SimpleBrowserApp.swift
//  SimpleBrowser
//
//  Created by Bakhtiyorjon Mirzajonov on 10/23/23.
//

import SwiftUI

@main
struct SimpleBrowserApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}

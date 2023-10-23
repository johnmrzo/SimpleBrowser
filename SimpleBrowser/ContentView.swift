//
//  ContentView.swift
//  SimpleBrowser
//
//  Created by Bakhtiyorjon Mirzajonov on 10/23/23.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel: ViewModel
    var body: some View {
      VStack {
        SearchBar(viewModel: viewModel)
      }
    }
}

#Preview {
    ContentView()
}

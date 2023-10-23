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
      WebView(viewModel: viewModel)
      BottomBar(viewModel: viewModel)
    }
    .sheet(isPresented: $viewModel.shouldShowShareSheet) {
      if let url: URL = URL(string: "https://\(viewModel.urlString)") {
        ShareSheet(activityItems: [url])
      }
    }
  }
}

#Preview {
    ContentView(viewModel: ViewModel())
}

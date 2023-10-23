//
//  SearchBar.swift
//  SimpleBrowser
//
//  Created by Bakhtiyorjon Mirzajonov on 10/23/23.
//

import SwiftUI

struct SearchBar: View {
  @ObservedObject var viewModel: ViewModel
  var body: some View {
    HStack {
      Text("URL:")
      TextField("URL", text: $viewModel.urlString)
        .keyboardType(.URL)
        .autocapitalization(.none)
        .disableAutocorrection(true)
    }
  }
}

#Preview {
    SearchBar(viewModel: ViewModel())
}

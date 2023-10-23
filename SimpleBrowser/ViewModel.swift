//
//  ViewModel.swift
//  SimpleBrowser
//
//  Created by Bakhtiyorjon Mirzajonov on 10/23/23.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
  @Published var webViewOptionsPublisher = PassthroughSubject<WebViewOptions, Never>()
  @Published var urlString: String = ""
  @Published var shouldShowShareSheet: Bool = false
  
  func goBack() {
    webViewOptionsPublisher.send(.back)
  }
  
  func goForward() {
    webViewOptionsPublisher.send(.forward)
  }
  
  func share() {
    webViewOptionsPublisher.send(.share)
  }
  
  func refresh() {
    webViewOptionsPublisher.send(.refresh)
  }
  
  func stop() {
    webViewOptionsPublisher.send(.stop)
  }
}

enum WebViewOptions {
  case back
  case forward
  case share
  case refresh
  case stop
}

//
//  WebView.swift
//  SimpleBrowser
//
//  Created by Bakhtiyorjon Mirzajonov on 10/23/23.
//

import SwiftUI
import WebKit
import Combine

struct WebView: UIViewRepresentable {
  @ObservedObject var viewModel: ViewModel
  
  func makeCoordinator() -> Coordinator {
    Coordinator(parent: self)
  }
  
  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.navigationDelegate = context.coordinator
    return webView
  }

  func updateUIView(_ webView: WKWebView, context: Context) {
    if let url = URL(string: "https://\(viewModel.urlString)") {
      webView.load(URLRequest(url: url))
    }
  }
  
  class Coordinator: NSObject, WKNavigationDelegate {
    var parent: WebView
    var webViewOptionsSubscriber: AnyCancellable?
    
    init(parent: WebView, webViewOptionsSubscriber: AnyCancellable? = nil) {
      self.parent = parent
      self.webViewOptionsSubscriber = webViewOptionsSubscriber
    }
    
    deinit {
      webViewOptionsSubscriber?.cancel()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
          webViewOptionsSubscriber = parent.viewModel.webViewOptionsPublisher.sink(receiveValue: { webViewOption in
            // create a switch statement for each of the different options
            switch webViewOption {
            case .back:
              if webView.canGoBack {
                webView.goBack()
              }
            case .forward:
              if webView.canGoForward {
                webView.goForward()
              }
            case .share: 
              self.parent.viewModel.shouldShowShareSheet = true
            case .refresh:
              webView.reload()
            case .stop:
              webView.stopLoading()
            }
          })
       }
  }
}

#Preview {
    WebView(viewModel: ViewModel())
}

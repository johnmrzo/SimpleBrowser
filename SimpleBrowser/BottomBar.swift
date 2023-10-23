//
//  BottomBar.swift
//  SimpleBrowser
//
//  Created by Bakhtiyorjon Mirzajonov on 10/23/23.
//

import SwiftUI

struct BottomBar: View {
  @ObservedObject var viewModel: ViewModel
  var body: some View {
    HStack {
      Spacer()
      Button(action: { }) {
        Image(systemName: "chevron.left")
      }
      Spacer()
      Button(action: { }) {
        Image(systemName: "chevron.right")
      }
      Spacer()
      Button(action: { }) {
        Image(systemName: "square.and.arrow.up")
      }
      Spacer()
      Button(action: { }) {
        Image(systemName: "arrow.clockwise")
      }
      Spacer()
      Button(action: { }) {
        Image(systemName: "xmark")
      }
      Spacer()
    }
  }
}

#Preview {
    BottomBar(viewModel: ViewModel())
}

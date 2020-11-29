//
//  InfoView.swift
//  ModalViewApp
//
//  Created by Kristaps Grinbergs on 29/11/2020.
//

import SwiftUI

struct InfoView: View {
  @Binding var activeSheet: Sheet?
  
  var body: some View {
    VStack(spacing: 50) {
      Text("Information view")
        .font(.largeTitle)
      
      Button(action: {
        activeSheet = nil
      }, label: {
        Label("Close", systemImage: "xmark.circle")
      })
    }
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView(activeSheet: Binding(get: { Sheet.info }, set: { _ in }))
  }
}

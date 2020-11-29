//
//  SettingsView.swift
//  ModalViewApp
//
//  Created by Kristaps Grinbergs on 29/11/2020.
//

import SwiftUI

struct SettingsView: View {
  @Binding var activeSheet: Sheet?
  
  var body: some View {
    VStack(spacing: 50)  {
      Text("Settings View")
        .font(.largeTitle)
      
      Button(action: {
        activeSheet = nil
      }, label: {
        Label("Close", systemImage: "xmark.circle")
      })
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView(activeSheet: Binding(get: { Sheet.settings }, set: { _ in }))
  }
}

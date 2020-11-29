//
//  ContentView.swift
//  ModalViewApp
//
//  Created by Kristaps Grinbergs on 29/11/2020.
//

import SwiftUI

struct ContentView: View {
  @State var showInfoModalView: Bool = false
  
  var body: some View {
    VStack(spacing: 50) {
      Text("Main View")
        .font(.largeTitle)
      
      Button(action: {
        showInfoModalView = true
      }, label: {
        Label("Show Info View", systemImage: "info.circle")
      })
    }
    .sheet(isPresented: $showInfoModalView) {
      InfoView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

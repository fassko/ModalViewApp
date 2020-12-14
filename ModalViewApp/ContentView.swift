//
//  ContentView.swift
//  ModalViewApp
//
//  Created by Kristaps Grinbergs on 29/11/2020.
//

import SwiftUI

enum Sheet: Identifiable {
  case info
  case settings
  
  var id: Int {
    hashValue
  }
}

extension Sheet {
  @ViewBuilder
  func modalView(with binding: Binding<Sheet?>) -> some View {
    switch self {
    case .info:
      InfoView(activeSheet: binding)
    case .settings:
      SettingsView(activeSheet: binding)
    }
  }
}

struct ContentView: View {
  @State var activeSheet: Sheet?
  
  var body: some View {
    VStack(spacing: 50) {
      Text("Main View")
        .font(.largeTitle)
      
      Button(action: {
        activeSheet = .info
      }, label: {
        Label("Show Info View", systemImage: "info.circle")
      })
      
      Button(action: {
        activeSheet = .settings
      }, label: {
        Label("Show Settings View", systemImage: "gear")
      })
    }
    .sheet(item: $activeSheet) { sheet in
      switch sheet {
      case .info:
        InfoView(activeSheet: $activeSheet)
      case .settings:
        SettingsView(activeSheet: $activeSheet)
      }
    }
    
    // Using binding with function on Sheet type
    // .sheet(item: $activeSheet) { $0.modalView(with: $activeSheet) }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

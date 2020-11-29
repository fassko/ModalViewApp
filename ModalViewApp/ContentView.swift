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
  var modalView: AnyView {
    switch self {
    case .info:
      return AnyView(InfoView())
    case .settings:
      return AnyView(SettingsView())
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
        InfoView()
      case .settings:
        SettingsView()
      }
    }
    // approach using computer property on Sheet type
    // .sheet(item: $activeSheet) { $0.modalView }
    
    // approach using computer property on Sheet type via keypath
    // .sheet(item: $activeSheet, content: \.modalView)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

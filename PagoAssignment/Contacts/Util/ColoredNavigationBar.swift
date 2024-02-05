//
//  ColoredNavigationBar.swift
//  PagoAssignment
//
//  Created by Pop, Andra on 04.02.2024.
//

import SwiftUI

struct ColoredNavigationBar: ViewModifier {
  var background: Color
  
  func body(content: Content) -> some View {
    content
      .toolbarBackground(
        background,
        for: .navigationBar
      )
      .toolbarBackground(.visible, for: .navigationBar)
  }
}

extension View {
  func navigationBarBackground(_ background: Color = .white) -> some View {
    return self
      .modifier(ColoredNavigationBar(background: background))
  }
}

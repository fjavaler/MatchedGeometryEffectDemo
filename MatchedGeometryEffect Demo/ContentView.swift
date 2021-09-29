//
//  ContentView.swift
//  MatchedGeometryEffect Demo
//
//  Created by Frederick Javalera on 9/29/21.
//

import SwiftUI

struct ContentView: View {
  
  @State private var isClicked: Bool = false
  @Namespace private var namespace
  
  var body: some View {
    VStack {
      if !isClicked {
        Circle()
          .matchedGeometryEffect(id: "rectangle", in: namespace)
          .frame(width: 100, height: 100)
      }
      
      Spacer()
      
      if isClicked {
        RoundedRectangle(cornerRadius: 25)
          .matchedGeometryEffect(id: "rectangle", in: namespace)
          .frame(width: 100, height: 100)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.red)
    .onTapGesture {
      withAnimation(.easeInOut) {
        isClicked.toggle()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

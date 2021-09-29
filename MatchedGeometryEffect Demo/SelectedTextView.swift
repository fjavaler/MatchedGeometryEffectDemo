//
//  SelectedTextView.swift
//  MatchedGeometryEffect Demo
//
//  Created by Frederick Javalera on 9/29/21.
//

import SwiftUI

struct SelectedTextView: View {
  
  let categories: [String] = ["Home", "Popular", "Saved"]
  @State private var selected: String = ""
  @Namespace private var namespace2
  
  var body: some View {
    HStack {
      ForEach(categories, id: \.self) { category in
        ZStack(alignment: .bottom) {
          if selected == category {
            RoundedRectangle(cornerRadius: 10)
              .fill(Color.red.opacity(10.0))
              .matchedGeometryEffect(id: "category_background", in: namespace2)
              .frame(width: 35, height: 2)
              .offset(y: 10)
          }
          
          Text(category)
            .foregroundColor(selected == category ? .red : .black)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 55)
        .onTapGesture {
          withAnimation(.spring()) {
            selected = category
          }
        }
      }
    }
  }
}

struct SelectedTextView_Previews: PreviewProvider {
  static var previews: some View {
    SelectedTextView()
  }
}

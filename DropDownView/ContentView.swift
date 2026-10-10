//
//  ContentView.swift
//  DropDownView
//
//  Created by Angelos Staboulis on 7/10/26.
//

import SwiftUI

struct ContentView: View {
    let items = [
        "Apple",
        "Google",
        "Microsoft",
        "Amazon"
    ]
    @State private var selectedItem: String?
    var body: some View {
        ZStack {
            DropdownView(
                options: items,
                selection: $selectedItem
            )
        }
        .padding()
        .zIndex(1000)
    }
}

#Preview {
    ContentView()
}

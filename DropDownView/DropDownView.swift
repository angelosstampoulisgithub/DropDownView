//
//  DropDownView.swift
//  DropDownView
//
//  Created by Angelos Staboulis on 7/10/26.
//

import SwiftUI

public struct DropdownView<Option: Hashable & CustomStringConvertible>: View {

    private let options: [Option]

    @Binding private var selection: Option?
    @State private var isExpanded = false

    public init(
        options: [Option],
        selection: Binding<Option?>
    ) {
        self.options = options
        self._selection = selection
    }

    public var body: some View {

        Button {
            withAnimation(.easeInOut) {
                isExpanded.toggle()
            }
        } label: {
            HStack {
                Text(selection?.description ?? "Select option")
                    .foregroundColor(selection == nil ? .gray : .primary)

                Spacer()

                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
            }
            .padding()
            .background(Color(.systemBackground))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3))
            }
        }
        .overlay(alignment: .topLeading) {

            if isExpanded {

                VStack(spacing: 0) {

                    ForEach(options, id: \.self) { option in

                        Button {
                            selection = option

                            withAnimation(.easeInOut) {
                                isExpanded = false
                            }
                        } label: {
                            HStack {

                                Text(option.description)

                                Spacer()

                                if selection == option {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                            .padding()
                        }

                        if option != options.last {
                            Divider()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground))
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
                .shadow(radius: 5)
                .offset(y: 55) // εμφανίζεται κάτω από το button
                .zIndex(1000)
            }
        }
    }
}

//
//  AddingView.swift
//  HelloDemo
//
//  Created by Jongwook Park on 2022/12/08.
//

import SwiftUI

struct AddingView: View {
    @StateObject var postitStore: PostitStore
    @Binding var showingSheet: Bool
    
    @State private var memo: String = ""
    @State private var colorIndex: Int = 0
    
    let colors: [Color] = [.cyan, .purple, .blue, .yellow, .brown]
    
    var trimMemo: String {
        memo.trimmingCharacters(in: .whitespaces)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Form {
                    Section(header: Text("Select a color")) {
                        HStack {
                            ForEach(Array(colors.enumerated()), id: \.offset) { (index, color) in
                                Button {
                                    colorIndex = index
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(color)
                                            .shadow(radius: 6)
                                            .frame(height: 60)
                                        
                                        if colorIndex == index {
                                            Image(systemName: "checkmark")
                                                .font(.title)
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    Divider()
                    Section(header: Text("Write a memo")) {
                        TextField("Memo", text: $memo, axis: .vertical)
                    }
                    .padding()
                    Spacer()
                }
                .navigationTitle("Add new Post")
                .formStyle(.columns)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            showingSheet.toggle()
                        }
                    }
                    
                    if trimMemo.count > 0 {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Submit") {
                                let createdAt = Date().timeIntervalSince1970
                                let postit: Postit = Postit(id: UUID().uuidString, user: "Steve", memo: memo, colorIndex: colorIndex, createdAt: createdAt)
                                postitStore.addPostit(postit)
                                showingSheet.toggle()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct AddingView_Previews: PreviewProvider {
    @State static var showingSheet = false
    
    static var previews: some View {
        AddingView(postitStore: PostitStore(), showingSheet: $showingSheet)
    }
}

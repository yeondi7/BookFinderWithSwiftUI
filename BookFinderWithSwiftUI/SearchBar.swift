//
//  SearchBar.swift
//  BookFinderWithSwiftUI
//
//  Created by 김연지 on 5/10/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @State var isEditing = false
    var handler:()->Void // 검색창 때문에
    var body: some View {
        HStack{
            TextField("검색어를 입력하세요.", text: $searchText)
                .padding()
                .background(Color(.systemGray6))
                .clipShape(.rect(cornerRadius: 15))
                .padding(.horizontal, 10)
            // [.horizontal]에 []있어도 상관없음...
                .onTapGesture {
                    isEditing = true
                }
                .onSubmit {
                    handler()
                }
            if isEditing {
                Button(action: {
                    isEditing = false
                    searchText = ""
                }, label: {
                    Text("cancel")
                })
                .padding(.trailing, 15) // cancel 위치조정
                .transition(.move(edge: .trailing))
            }
        }
    }
}

#Preview {
    SearchBar(searchText: .constant("여름"), handler: {})
}

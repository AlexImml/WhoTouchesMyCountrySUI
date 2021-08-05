//
//  FilterPopUp.swift
//  WhoTouchesMyCountrySUI
//
//  Created by Alex on 04/08/2021.
//

import SwiftUI

struct SortPopUp: View {
    @Binding var sortType: SortPopUpOptions
    @Binding var show: Bool
    private var confirmClick: () -> ()
    
    init(sortType: Binding<SortPopUpOptions>, show: Binding<Bool>, confirm: @escaping () -> ()) {
        self._sortType = sortType
        self._show = show
        self.confirmClick = confirm
    }
    
    var body: some View {
        ZStack {
            if show {
                Color.white
                VStack { 
                    Text("Sort by")
                        .font(.title)
                    picker
                    okBtn
                }
                .padding()
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 1)
        )
        
    }
    
    
    // MARK:- view parts
    private var picker: some View {
        HStack(alignment: .center) {
            Picker("Sort Options", selection: $sortType) {
                ForEach(SortPopUpOptions.allCases){ option in
                    option.view
                }
            }
        }
    }
    
    private var okBtn: some View {
        Button(action: {
            // Dismiss the PopUp
            withAnimation(.linear(duration: 0.3)) {
                show = false
            }
            self.confirmClick()
        }, label: {
            Text("OK")
                .frame(maxWidth: .infinity)
                .frame(height: 54, alignment: .center)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .font(Font.system(size: 23, weight: .semibold))
        })
        .buttonStyle(PlainButtonStyle())
        .cornerRadius(15)
    }
}

struct SortPopUp_Previews: PreviewProvider {
    static var previews: some View {
        SortPopUp(sortType: .constant(.sizeDescending), show: .constant(true), confirm: {})
    }
}


// MARK:- SortPopUpOptions enum

enum SortPopUpOptions: CaseIterable, Identifiable {
    case none
    case sizeAscending
    case sizeDescending
    case nameAscending
    case nameDescending
    
    
    var id: SortPopUpOptions { self }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .none:  Text(text)
        case .sizeAscending, . sizeDescending,
             .nameAscending, .nameDescending
        :  HStack {
            Text(text)
            Image(systemName: imageName)
                .foregroundColor(.blue)
        }
        
        }
    }
    
    private var text: String {
        switch self {
        case .none: return "None"
        case .nameAscending,.nameDescending: return "Name"
        case .sizeAscending,.sizeDescending: return "Size"
        }
    }
    private var imageName: String {
        switch self {
        case .none: return "no image"
        case .nameAscending,.sizeAscending: return "arrow.up.to.line"
        case .nameDescending,.sizeDescending: return "arrow.down.to.line"
        }
    }
}

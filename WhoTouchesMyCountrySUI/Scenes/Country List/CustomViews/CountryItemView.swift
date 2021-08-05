//
//  CountryItemView.swift
//  WhoTouchesMyCountrySUI
//
//  Created by Alex on 05/08/2021.
//

import SwiftUI

struct CountryItemView: View {
    
    var country: Country
    
    var body: some View {
        ZStack(alignment: .leading)  {
            Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
            VStack(alignment: .leading) {
                Text("Name: \(country.name ?? "missing name")")
                    .font(.headline)
                Text("Native Name: \(country.nativeName ?? "missing name")")
                    .font(.subheadline)
                    
            }
            .padding(.leading, 5)
            
        }
    }
}

struct CountryItemView_Previews: PreviewProvider {
    static var previews: some View {
        let country = Country(name: "qq", nativeName: "ss", area: 0, cioc: "", borders: [], id: UUID())
        CountryItemView(country: country)
    }
}

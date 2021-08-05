//
//  CountryBodrerlistView.swift
//  WhoTouchesMyCountrySUI
//
//  Created by Alex on 05/08/2021.
//

import SwiftUI

struct CountryBorderListView: View {
    
    @ObservedObject var countryBorderListVM: CountryBorderListVM
    
    init(_ countryBorderListVM : CountryBorderListVM) { // connivance
        self.countryBorderListVM = countryBorderListVM
    }
    
    var body: some View {
        VStack {
            title
            ZStack {
                list
                if countryBorderListVM.filteredCountries.isEmpty {
                    Text("No one !")
                        .font(.title)
                }
            }
        }
    }
    
    // MARK:- view parts
    private var title: some View {
        Text("Who touches \(countryBorderListVM.selectedCountry.name ?? "unknown") borders ?!")
            .font(.title)
    }
    
    private var list: some View {
        List {
            ForEach(countryBorderListVM.filteredCountries) { country in
                ZStack {
                    CountryItemView(country: country)
                        .cornerRadius(3.0)
                }
            }
        }
    }
}
    
    struct CountryBorderListView_Previews: PreviewProvider {
        static var previews: some View {
            let list = CountryListVM().countriesArray
            let country = Country(name: "Israel", nativeName: "ישראל", area: 5, cioc: "", borders: [], id: UUID())
            let vm = CountryBorderListVM(countryList: list, selectedCountry: country)
            CountryBorderListView(vm)
        }
    }

//
//  ContentView.swift
//  WhoTouchesMyCountrySUI
//
//  Created by Alex on 04/08/2021.
//

import SwiftUI

struct CountryListView: View {
    
    @ObservedObject var countryListVM = CountryListVM()
    @State var showFilterOptions: Bool = false
    @State var sortOption: SortPopUpOptions = .none
    
    
    var body: some View {
        NavigationView {
            ZStack {
                list
                .navigationTitle("Country List")
                .navigationBarItems(trailing: navBtn)
                popUp
            }
        }
    }
    
    // MARK:- view parts
    
    private var navBtn: some View {
        Button(action: {
                            withAnimation(.easeInOut) {
                                showFilterOptions.toggle()
                            }}) {
            Image(systemName: "arrow.up.arrow.down")
        }
    }
    
    private var list: some View {
        List {
            ForEach(countryListVM.countriesArray) { country in
                ZStack {
                    CountryItemView(country: country)
                            .cornerRadius(3.0)
                    NavigationLink(destination: CountryBorderListView(countryListVM.getCountryBordersVM(for: country))) {
                        EmptyView() // placing CountryItemView inside the navigation link addd an annoying arrow.
                    }
                    .opacity(0.0)
                }
            }
        }
    }
    
    
    private var popUp: some View {
        SortPopUp(sortType: $sortOption, show: $showFilterOptions, confirm: filterOptionsClicked)
            .frame(width: UIScreen.main.bounds.width - 100 ,height: 200)
    }
    
    
    
    // MARK:- hellper methods
    private func filterOptionsClicked() {
        countryListVM.sortCountries(for: sortOption)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}

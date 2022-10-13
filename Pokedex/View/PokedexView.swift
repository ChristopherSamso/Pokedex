//
//  PokedexView.swift
//  Pokedex
//
//  Created by Christopher Samso on 10/5/22.
//

import SwiftUI

// NavigationView is used not only for applying a nice title to the view but it will also manage any future navigation from this view.
// LazyVGrid inside of scrollview is the swift ui equivalent to a CollectionView
// LazyVGrid also loads items in a "Lazy Fashion" in other words things are only loaded in on an "as needed basis". Specially helpful when grid is populated from api calls... you don't want everything to load at once.
let coloredNavAppearance = UINavigationBarAppearance()

struct PokedexView: View {
    @ObservedObject var viewModel = PokemonViewModel()
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    init() {
        coloredNavAppearance.configureWithTransparentBackground()
        coloredNavAppearance.backgroundColor = .systemGray2.withAlphaComponent(0.7)
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing){
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ForEach(viewModel.pokemon) { pokemon in
                            PokemonCell(pokemon: pokemon, viewModel: viewModel)
                        }
                    }
                    .padding(.top, 15)
                    .background(Color(.systemGray2))
                }
                .background(Color(.systemGray2))
                .navigationTitle("Pokedex")
                .foregroundColor(.white)
                .navigationBarTitleDisplayMode(.large)
                
                Button {
                    print("Filter")
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                        .resizable()
                        .frame(width: 55, height: 55)
                }
                .background(Color(.green))
                .foregroundColor(.black)
                .clipShape(Circle())
                .padding()
            }
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}

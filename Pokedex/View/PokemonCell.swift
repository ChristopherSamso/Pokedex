//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Christopher Samso on 10/5/22.
//

import SwiftUI
import Kingfisher
struct PokemonCell: View {
    let pokemon: Pokemon
    let viewModel: PokemonViewModel
    let backgroundColor: Color
    
    init(pokemon: Pokemon, viewModel: PokemonViewModel) {
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = Color(viewModel.backGroundColor(forType: pokemon.type))
    }
    
    var body: some View {
        
        ZStack {
            
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)

                HStack {
                    
                    Text(pokemon.type)
                        .font(.subheadline)
                        .bold().foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.25))
                        }
                        .frame(width: 100, height: 24)
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
            
        }
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: backgroundColor, radius: 6, x: 5.0, y: 5.0)
    }
}

//struct PokemonCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonCell(pokemon: MOCK_POKEMON[0])
//    }
//}

//
//  ContentView.swift
//  TicTacToe-SwiftUI
//
//  Created by Safar Safarov on 2020/10/2.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("Tic Tac Toe")
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    // Moves
    @State var moves : [String] = Array(repeating: "", count: 9)
    @State var isPlaying = true
    var body: some View {
        VStack {
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 15), count: 3),spacing: 15){
                
                ForEach(0..<9,id: \.self){index in
                    ZStack {
                        Color.white
                        
                        Text(moves[index])
                            .font(.system(size: 55))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                    .frame(width: getWidth(), height: getWidth())
                    .cornerRadius(25)
                    .onTapGesture(perform: {
                        withAnimation(Animation.easeIn(duration: 0.5)){
                            moves[index] = isPlaying ? "X" : "0"
                            isPlaying.toggle()
                        }
                    })
                }
            }
            .padding(15)
        }
    }
    
    func getWidth()->CGFloat{
        
        let width = UIScreen.main.bounds.width - (30 + 30)
        
        return width / 3
    }
}

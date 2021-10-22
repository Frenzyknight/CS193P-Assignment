//
//  ContentView.swift
//  Assignment 1
//
//  Created by Gaurav Ganju on 08/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚂", "🚀", "🚘", "✈️", "🚑", "🚚", "🏍", "🚲", "🏎", "🚢", "🚁", "🛸", "🚔", "🛴", "🛵", "🚎", "🚟", "🚤", "🚃", "🚕", "🚍", "🛻", "🛩", "🚜"]
    var vehicles = ["🚂", "🚀", "🚘", "✈️", "🚑", "🚚", "🏍", "🚲", "🏎", "🚢", "🚁", "🛸", "🚔", "🛴", "🛵", "🚎", "🚟", "🚤", "🚃", "🚕", "🚍", "🛻", "🛩", "🚜"]
    var sports = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓",
        "🏸", "🏒", "🏑", "🥍", "🏏", "🪃", "🥅", "⛳️", "🪁", "🏹", "🎣", "🤿", "🥊", "🥋", "🎽"]
    var animals = ["🐶","🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🐤", "🦆", "🦅", "🦉", "🦇"]
    @State var emojiCount = 20
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                HStack {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                        ForEach(emojis[0..<emojiCount], id: \.self) {
                            emojis in
                            CardView(content: emojis).aspectRatio(2/3, contentMode: .fit)
                        }
                }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                vbttn
                Spacer()
                sbttn
                Spacer()
                abttn
            }
            .padding(.vertical)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var vbttn: some View {
            Button {
                if emojiCount <= vehicles.count {
                    emojis = vehicles.shuffled()
                }
                
            } label: {
                VStack {
                    Image(systemName: "car.circle")
                    Text("Vehicles")
                        .font(.footnote)
                        .padding(.horizontal)
                }
            }
    }
    
    var sbttn: some View {
        Button {
            if emojiCount <= sports.count {
                emojis = sports.shuffled()
            }
        } label: {
            VStack {
                Image(systemName: "figure.walk.circle")
                Text("Sports")
                    .font(.footnote)
                    .padding(.horizontal)
                    
            }
        }
    }
    
    var abttn: some View {
            Button {
                if emojiCount <= animals.count {
                    emojis = animals.shuffled()
                }
                
            } label: {
                VStack {
                    Image(systemName: "pawprint.circle")
                    Text("Animals")
                        .font(.footnote)
                        .padding(.horizontal)
                    
                }
            }
    }

}

struct CardView: View {
    var content: String
    @State var FaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius:25)
            if FaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }

        }.onTapGesture {
            FaceUp = !FaceUp
        }
    }
}




struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
                    .preferredColorScheme(.dark)

                
            }
        }


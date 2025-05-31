//
//  ContentView.swift
//  Jokes App Challenge
//
//  Created by Conor Howard on 31/05/2025.
//

import SwiftUI

struct MainView: View {
    
    var dataService = DataService()
    
    @State var jokeResponse: JokeResponse?
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await getJoke()
                }
            } label: {
                Text("Get Joke")
            }

        }
        .padding()
        .task {
            await getJoke()
        }
    }
    
    func getJoke() async {
        do {
            jokeResponse = try await dataService.getJoke()
        } catch {
            print(error)
        }
    }
}

#Preview {
    MainView()
}

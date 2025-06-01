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
            
            Spacer()
            
            if let jokeResponse = jokeResponse {
                
                switch jokeResponse.type {
                case .single:
                    Text("\(jokeResponse.joke!)")
                        .font(.title)
                case .twopart:
                    Text("\(jokeResponse.setup!)")
                        .font(.title)
                        .padding(.bottom,40)
                    Text("\(jokeResponse.delivery!)")
                        .font(.title2)
                }
                
            }
            
            Spacer()
            
            Button {
                Task {
                    await getJoke()
                }
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 44)
                        .cornerRadius(15)
                    Text("Get Joke")
                        .foregroundStyle(.white)
                }
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

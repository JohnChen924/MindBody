//
//  ContentView.swift
//  Test
//
//  Created by John Chen on 2/12/24.
//

import SwiftUI

struct HomePageView: View {
    @State private var showingCalendar = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Our App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                Image("appLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: DetailView()) {
                    Text("Go to Details")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 10)
                
                Button(action: {
                    print("Settings button tapped")
                }) {
                    Text("Settings")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                
                Button("Show Calendar") {
                    showingCalendar = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                // Present Page2Wrapper
                .sheet(isPresented: $showingCalendar) {
                    Page2Wrapper()
                }
                .padding()
            }
            
        }
        
    }
}
struct DetailView: View {
    var body: some View {
        Text("Details View")
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

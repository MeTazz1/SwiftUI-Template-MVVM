//
//  ContentView.swift
//  SwiftUI-Template-MVVM
//
//  Created by Chris on 3/26/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    // MARK: - HomeViewModel
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
        NavigationView {
            // YOUR CONTENT HERE
            List(viewModel.items, id: \.id) { item in
                NavigationLink(destination: DetailsView(item: item), label: {
                    Text("Item #\(item.value)")
                })
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitle(Text("Home view"))
        }
        .onAppear() {
            self.viewModel.loadData()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                #warning("Test purpose, simulating an update after 5 seconds")
                // Please note that since we are using a class object (Item) as @Published,
                // we need to call objectWillChange.send() to emit the reference change.
                // If you use a struct object for Item, you will not need 
                self.viewModel.objectWillChange.send()
                
                self.viewModel.items[5].value = Int32(123121)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let home = HomeView.ViewModel()
    
    static var previews: some View {
        HomeView(viewModel: ContentView_Previews.home)
    }
}

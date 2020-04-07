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
            VStack {
                List(self.viewModel.dataSource, id: \.id) { item in
                    HStack {
                        Image(systemName: "\(item.value).circle")
                            .imageScale(.large)
                            .padding(.trailing, 20)
                            .foregroundColor(.green)
                        
                        NavigationLink(destination: DetailsView(item: item), label: {
                            Text("Item #\(item.value)")
                        })
                    }
                }
            }
            .animation(.linear)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitle(Text("Home view"))
        }
        .onAppear() {
            self.viewModel.initData()
            
            /// For test purpose, we create an update of the row #5 after 5 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                // Please note that since we are using a class object (Item) as @Published,
                // we need to call objectWillChange.send() to emit the reference change.
                withAnimation {
                    print("Forcing an auto-update after 5 seconds for test purposes.")
                    self.viewModel.objectWillChange.send()
                    self.viewModel.dataSource[5].value = Int32(50)
                }
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

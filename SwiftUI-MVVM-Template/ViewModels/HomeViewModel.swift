//
//  HomeViewModel.swift
//  SwiftUI-Template-MVVM
//
//  Created by Chris on 3/26/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI
import CoreData

extension HomeView {
    
    /// HomeView-ViewModel
    class ViewModel: ObservableObject, ViewModelProtocol {
        
        /// List of items to display
        @Published private(set) var items: [Item] = []
        
        /// Core Data Store context
        private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        	
        // MARK: - ViewModelProtocol methods
        
        /// Loading data from local Core Data Store
        func loadData() {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Item.entity().name!)
            fetchRequest.sortDescriptors = [NSSortDescriptor(key: "value", ascending: true)]
            
            do {
                let coreDataItems = try context.fetch(fetchRequest) as? [Item]
                if let coreDataItems = coreDataItems {
                    if coreDataItems.count != 0 { items = coreDataItems }
                    else {
                        #if debug
                        self.populateData()
                        #endif
                    }
                }
            }
            catch {
                print("Error: Couldn't load [Item] from Core Data Store")
            }
        }
        
        /// For test purpose, we generate data
        func populateData() {
            for i in 0 ... 10 {
                let newItem = Item(context: context)
                newItem.id = UUID()
                newItem.value = Int32(i)
                newItem.printItem()
            }
            try? context.save()
            self.loadData()
        }
    }
}





struct HomeViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

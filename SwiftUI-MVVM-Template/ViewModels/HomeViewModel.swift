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
    class ViewModel: ObservableViewModel<Item>{
        
        /// Core Data Store context
        private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        init() {
            super.init(dataSource: [Item]())
        }
        
        /// OS cleaning memory
        deinit {
            self.deinitData()
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
            self.initData()
        }
    }
}

extension HomeView.ViewModel: ViewModelDataSource {
    
    /// Init the ViewModel data source by reading Core Data stored items
    func initData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Item.entity().name!)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "value", ascending: true)]
        
        do {
            let coreDataItems = try context.fetch(fetchRequest) as? [Item]
            if let coreDataItems = coreDataItems {
                if coreDataItems.count != 0 { self.dataSource = coreDataItems }
                else {
                    #if DEBUG
                    self.populateData()
                    #endif
                }
            }
        }
        catch {
            print("Error: Couldn't load [Item] from Core Data Store")
        }
    }
    
    /// Unload and deinit ViewModelDataSource
    func deinitData() {
        self.dataSource.removeAll()
    }
}

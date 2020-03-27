//
//  DetailsView.swift
//  SwiftUI-Template-MVVM
//
//  Created by Chris on 3/26/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    
    // MARK: - The Details's observed object. Changes will change the view's state
    @ObservedObject var item: Item
    
    var body: some View {
        VStack {
            Text("You are viewing item #\(item.value)")
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static let item = Item()
    
    init() {
        DetailsView_Previews.item.id = UUID()
        DetailsView_Previews.item.value = 50
    }

    static var previews: some View {
        DetailsView(item: DetailsView_Previews.item)
    }
}

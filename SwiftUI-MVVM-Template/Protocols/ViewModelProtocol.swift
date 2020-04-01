//
//  ViewModelProtocol.swift
//  SwiftUI-Template-MVVM
//
//  Created by Chris on 3/26/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

/// Generic ViewModelProtocol for all ViewModels in app to conform the loadData and populateData
protocol ViewModelProtocol {
    func loadData()
    func populateData()
}

//
//  ViewModelDataSource.swift
//  SwiftUI-Weather
//
//  Created by Christophe Dellac on 4/6/20.
//  Copyright © 2020 Christophe Dellac. All rights reserved.
//

/// ViewModel data Source protocol
/// - initData()
/// - deinitData()
protocol ViewModelDataSource {
    // MARK: - Life cycle
    /// First data initialization when creating ViewModel
    func initData()
    /// Data deinit when freeing ViewModel
    func deinitData()
}

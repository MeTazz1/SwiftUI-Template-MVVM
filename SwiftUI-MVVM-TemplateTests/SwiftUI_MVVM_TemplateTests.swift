//
//  SwiftUI_MVVM_TemplateTests.swift
//  SwiftUI-MVVM-TemplateTests
//
//  Created by Chris on 3/26/20.
//  Copyright © 2020 Chris Dlc. All rights reserved.
//

import XCTest
@testable import SwiftUI_MVVM_Template

class SwiftUI_MVVM_TemplateTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func test_HomeViewModelData() {
        let homeViewModel = HomeView.ViewModel()
        homeViewModel.loadData()
        XCTAssertTrue(homeViewModel.items.count > 0)
        
        if homeViewModel.items.count == 0 {
            homeViewModel.populateData()
            XCTAssertTrue(homeViewModel.items.count > 0)
        }
        
    }

}

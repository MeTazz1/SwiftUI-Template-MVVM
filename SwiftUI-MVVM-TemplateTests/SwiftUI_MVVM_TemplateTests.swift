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
        
        XCTAssertNotNil(homeViewModel)
        XCTAssertEqual(homeViewModel.dataSource.count, 0)
        
        homeViewModel.initData()
        XCTAssertTrue(homeViewModel.dataSource.count > 0)
        
        homeViewModel.deinitData()
        XCTAssertTrue(homeViewModel.dataSource.count == 0)

    }

}

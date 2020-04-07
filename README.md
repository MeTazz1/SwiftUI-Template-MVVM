# SwiftUI-Template-MVVM 
> A ready-to-use SwiftUI Clean MVVM template to use when creating a new project including Core Data, a generic type of data source for your ViewModels, a customizable ViewModelDataSource protocol and a standard App Configuration.


This template is intended to reduce the amount of time it takes to create and setup a new project with SwiftUI. 

It includes a sample project that contains:
* A clean MVVM Design Architecture (Model - View - ViewModel) with a subfolder for each category,
* Ready-to-go generic superclass to handle every type of data source used in your views,
* CoreData setup,
  * an example Item and its extension for custom methods and computed properties,
* Sample views using Core Data objects as data source, in a List and Detail View
  * HomeView
  * DetailsView
* Tests cases, 

Feel free to clone this template and to reuse it!

XCode, target iOS 13
## Installation



```sh
git clone https://github.com/christophedellac/SwiftUI-Template-MVVM
```

Then, rename the project as you wish and start having fun! You can leave it as is, or rename/delete the existing objects. 




## Release History
* 1.1.0
    * Implementation of a generic type for your view's data source 
    * Creation of a ViewModelDataSource protocol for your ViewModels
    * Better XCT test cases 

* 1.0.0
    * The first proper release
    * CHANGE: Add all files
* 0.0.1
    * Work in progress

## Meta

Christophe Dellac

No licence, you are free to reuse this template!

https://github.com/christophedellac

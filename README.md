# SwiftUI In A Swift Playground 🛝

[Download](https://github.com/MatthewpHarding/FREE-PLAYGROUND-swiftui/archive/refs/heads/main.zip) this Swift playground file to run the example given in [Xcode](https://developer.apple.com/xcode).

## This Playground Teaches 👨🏻‍🏫
How to create and display a SwiftUI view inside a Swift playground. 

Swift playgrounds now support displaying both a UIKit and a SwiftUI view *(both are different UI frameworks)* within a Swift playground. The support isn't advanced or in-depth however it will be enough to try something out or maybe just to add a visual layer to your code.

The code to display a SwiftUI `View` will look something like this:

```Swift
// MARK: - 📦 Sourcecode
import SwiftUI // import all the UI code
import PlaygroundSupport // import the ability to use a live view

class ViewModel: ObservableObject {
    let title: String
    init(title: String) {
        self.title = title
    }
}

struct ContentView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        Text(viewModel.title)
    }
}

// MARK: - ⚡️ Execution Area
let viewModel = ViewModel(title: "Learn Swift")
let contentView = ContentView(viewModel: viewModel)
PlaygroundPage.current.setLiveView(contentView)
// << 🔵 Run Point
```

## How To Download ⬇️
You can download this Swift playground by clicking the `Code` button at the top of this page. 

## How To Run 🏃🏾‍♂️
Swift playground files run within [Xcode](https://developer.apple.com/xcode) *(the tool used by developers to build apps)* and you simply need to double click the file.

## Why Learn In A Playground 🛝
Swift playgrounds allow for rapid developmemt and provide a very fast and fluid thought-to-code process. There is no time taken to compile, build or install an app to an iOS simulator. Instead, the compilation time is fast and results are viewed almost immediately. 

The term "playground" is a very fitting name for both the feature and the file extension itself. It may be safe to assume that this feature was designed for "playing around"... or "learning" as we like to call it. 😆

## Thanks for reading 📖
👨🏼‍💻
@[MatthewpHarding](https://github.com/MatthewpHarding)

*written for the `Swift Simplified` learning community*

```Swift
let myLife = [learning, coding, happiness] 
```
### 🧕🏻👨🏿‍💼👩🏼‍💼👩🏻‍💻👨🏼‍💼🧛🏻‍♀️👩🏼‍💻💁🏽‍♂️🕵🏻‍♂️🧝🏼‍♀️🦹🏼‍♀🧕🏾🧟‍♂️

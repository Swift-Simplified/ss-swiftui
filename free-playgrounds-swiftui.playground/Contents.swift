/*: ![Swift](matt-harding-logo.png)
 
 */
//: # Swift Simplified
//: ## A Free Playground
//: ## Demonstrating: SwiftUI
//: ![instructor](instructor.png) [*with Matthew Harding*](https://www.udemy.com/user/iosbfree/)
//:
//: Swift v5.7 | 🚀 *Simplified for fast learning*
//:
//: -------------------
//: ## Welcome 👋🏿👋🏻👋🏽
//: Welcome to a small playground demonstrating how to display a SwiftUI `View` in a Swift playground.
//:
//: Execute the run points 🔵 below.
//:
//: Edit and experiment with the code!
//:
//: Don't stop writing code until you can see why things work the way they do.
//-----code-play-area


// #practice #practice #practice



//-----code-play-area
//:
//: -------------------
//: ## Adding A SwiftUI View
//: The example below creates a SwiftUI `View` and sets it to  the live view for this Swift playground.
//:
//: 👉 Execute the next run point to display the `View` and experiment with the code below.
// MARK: - 📦 Sourcecode
import SwiftUI // import all the UI code
import PlaygroundSupport // import the ability to use a live view

class ViewModel1: ObservableObject {
    let title: String
    init(title: String) {
        self.title = title
    }
}

struct ContentView1: View {
    
    @StateObject var viewModel: ViewModel1
    
    var body: some View {
        Text(viewModel.title)
    }
}

// MARK: - ⚡️ Execution Area
let viewModel1 = ViewModel1(title: "Learn Swift")
let contentView1 = ContentView1(viewModel: viewModel1)
PlaygroundPage.current.setLiveView(contentView1)
// << 🔵 Run Point

//: ## Advanced Solution
//: The UI *(User Interface)* should always be "dumb" and be led by a data model such as a "view model".
//:
//: This design separates out the business logic from the `View` and is the type of acrchitecture that you'll find in industry!
//:
//: 👉 Let's add some more code and try to create a bigger `View` backed by an even bigger `ViewModel`.
// MARK: - 📦 Sourcecode
struct Message: Hashable {
    let id: String
    let title: String
    let description: String
}

protocol Footer {
    var text: String { get }
}

struct BrandedFooter: Footer {
    let text = """
    Created by Swift Simplified.com
    Online Courses | Careers Advice | GitHub Repos
    
    🤩 ..let's live a better life,
    by learning Swift 🛠

    Swift Simplified.com

    👋🏿👋🏻👋🏽
    Welcome to...
    the Swift Simplified community
    
    
    🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️
    """
}

class ViewModel: ObservableObject {
    let title: String
    let notifications: [Message]
    var agreementCompleted: Bool
    let footer: Footer
    
    init(title: String,
    notifications: [Message],
    agreementCompleted: Bool,
         footer: Footer) {
        self.title = title
        self.notifications = notifications
        self.agreementCompleted = agreementCompleted
        self.footer = footer
    }
    
    func userAgreementTriggered() {
        agreementCompleted = true
        print("✅ You WILL Learn Swift!")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.55, execute: {
            print("😎... because you're amazing ✨")
        })
    }
}

struct ContentView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        let spacing: Double = 20
        let sectionTitleFont: Font = .system(size: 20, weight: .bold, design: .serif)
        let pageTitleFont: Font = .system(size: 40, weight: .bold, design: .serif)
        let pageFooterFont: Font = .system(size: 11, weight: .ultraLight, design: .serif)
        Spacer(minLength: spacing * 2)
        Text(viewModel.title).font(pageTitleFont)
        Spacer(minLength: spacing)
        ForEach((viewModel.notifications), id: \.self) { notification in
            Text(notification.title).font(sectionTitleFont)
            Spacer(minLength: spacing)
            Text(notification.description)
            Spacer(minLength: spacing)
        }
        Spacer(minLength: spacing * 2)
        let buttonColor: Color = viewModel.agreementCompleted ? .green : .blue
        Button("I Will Learn Swift") {
            viewModel.userAgreementTriggered()
        }.foregroundColor(buttonColor).disabled(viewModel.agreementCompleted)
        Spacer(minLength: spacing * 4)
        Text(viewModel.footer.text).font(pageFooterFont)
        Spacer(minLength: spacing * 4)
    }
}

let viewModel = ViewModel(title:    "Swift Simplified", notifications: [
    Message(id: "1", title:    "Swift Playgrounds", description: """
                                    Playgrounds are incredible and support fast
                                    learning as they encourage fast development
                                    of an idea and viewing the immediate results.
                                    """),
    Message(id: "2", title:    "Study Swift", description: """
                                    Study the Swift language in order to perfect
                                    your programming career. The language is the
                                    foundation and others will come to you if you
                                    have the answers and \"know how\".
                                    """),
    Message(id: "3", title: "Study Architecture", description: """
                                    After understanding the language be sure to
                                    understand how to construct a solution. We
                                    use the language to write behaviour and that
                                    behaviour creates construction blocks to
                                    build layers of achitecture.
                                    """),
],
agreementCompleted: false,
footer: BrandedFooter())


// MARK: - ⚡️ Execution Area
let contentView = ContentView(viewModel: viewModel) // 💡 Tip: Always keep the view dumb!
PlaygroundPage.current.setLiveView(contentView)
// << 🔵 Run Point
//:
//: -------------------
//: 🤩 **Congratulations** 🎉
//:
//: You learned something new - hopefully. 🤞
//:
//: Use this playground to play about and edit the code - have some fun! It's a great opportunity to practice something new. 👏🏼👏🏾👏
//:
//: -------------------
//: ## Created by [SwiftSimplified.com](https://www.swiftsimplified.com)
//: [SwiftSimplified.com](https://www.swiftsimplified.com)
//:
//: This playground is intended as extra resource for students taking our Swift Simplified online course - or for anyone else learning Swift.
//:
//: ![instructor](instructor.png) Created by [Matthew Harding](https://github.com/MatthewpHarding) | [GitHub](https://github.com/MatthewpHarding)| [Website](https://www.swiftsimplified.com) | [Our Courses](https://www.udemy.com/user/iosbfree/)
//:
//: 🤩 *..let's live a better life, by learning Swift* 🛠
//:
//: ### 🧕🏻🙋🏽‍♂️👨🏿‍💼👩🏼‍💼👩🏻‍💻💁🏼‍♀️👨🏼‍💼🙋🏻‍♂️🙋🏻‍♀️👩🏼‍💻🙋🏿💁🏽‍♂️🙋🏽‍♀️🙋🏿‍♀️🧕🏾🙋🏼‍♂️

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
//: Welcome to a small playground demonstrating SwiftUI.
//:
//: Execute the run point 🔵 below, edit and experiment with the code! Don't stop writing code until you can see why things work the way they do. #practice #practice #practice
//:
//: 👉 Let's write some code to show the visual side of some business logic.
//:
//: 💡 Tip: The UI *(User Interface)* should always be "dumb" and be led by a data model such as a "view model", taken from the "MVVM" design pattern. 😎
// MARK: - 📦 Sourcecode
import SwiftUI // import all the UI code
import PlaygroundSupport // import the ability to use a live view

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
    Created by Matthew Harding
    GitHub | Our Courses | Udemy.com
    
    🤩 ..let's live a better life,
    by learning Swift 🛠

    Swift Simplified.com

    👋🏿👋🏻👋🏽
    Welcome to...
    The Swift Simplified Community
    
    
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
            print("✅ You WILL Learn Swift!")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.55, execute: {
                print("😎... because you're amazing ✨")
            })
            viewModel.agreementCompleted = true // doesn't refresh in a playground sadly - one shot execution
        }.foregroundColor(buttonColor).disabled(viewModel.agreementCompleted)
        Spacer(minLength: spacing * 4)
        Text(viewModel.footer.text).font(pageFooterFont)
        Spacer(minLength: spacing * 4)
    }
}

let viewModel = ViewModel(title:    "Swift Simplified", notifications: [
    Message(id: "1", title:    "Swift Playgrounds", description: """
                                    playgrounds are incredible and support fast
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
//: Generics is an advanced topic! - you're nailing it! 👏🏼👏🏾👏
//:
//: Keep going!.. 🥳
//:
//: [Previous](@previous) | [Next](@next)
//:
//: ### Extra reading
//: *Official Swift Language Guide: [Generics](https://github.com/MatthewpHarding/SWIFTDOCS-23-generics)*


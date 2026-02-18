[![Swift](https://img.shields.io/badge/Swift-6.2-ea7a50.svg?logo=swift&logoColor=white)](https://developer.apple.com/swift/)
[![Xcode](https://img.shields.io/badge/Xcode-26.3-50ace8.svg?logo=xcode&logoColor=white)](https://developer.apple.com/xcode/)
[![SPM](https://img.shields.io/badge/SPM-ready-b68f6a.svg?logo=gitlfs&logoColor=white)](https://developer.apple.com/documentation/xcode/swift-packages)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%20%7C%20iPadOS%20%7C%20macOS%20%7C%20Mac%20Catalyst%20%7C%20tvOS-lightgrey.svg?logo=apple&logoColor=white)](https://en.wikipedia.org/wiki/List_of_Apple_operating_systems)
[![License](https://img.shields.io/badge/License-MIT-67ac5b.svg?logo=googledocs&logoColor=white)](https://en.wikipedia.org/wiki/MIT_License)
[![CI](https://github.com/thatfactory/cgkstatemachine/actions/workflows/ci.yml/badge.svg)](https://github.com/thatfactory/cgkstatemachine/actions/workflows/ci.yml)
[![Release](https://github.com/thatfactory/cgkstatemachine/actions/workflows/release.yml/badge.svg)](https://github.com/thatfactory/cgkstatemachine/actions/workflows/release.yml)

# CGKStateMachine 🔀
A **custom** [`GKStateMachine`](https://developer.apple.com/documentation/gameplaykit/gkstatemachine) subclass that allows [GKState](https://developer.apple.com/documentation/gameplaykit/gkstate) changes to be observed using [Combine](https://developer.apple.com/documentation/combine).

## Usage Examples
```swift
// Create a state machines of `CGKStateMachine` type.
let cgkStateMachine = CGKStateMachine(
    states: [
        FirstState(),
        SecondState()
    ]
)

// Create states of `CGKState` type.
class FirstState: CGKState {}
class SecondState: CGKState {}

// Sink `publishedState`.
var cancellables = Set<AnyCancellable>()

cgkStateMachine.publishedState
    .sink { state in
        // React here 👈🏻👈🏻👈🏻
    }
    .store(in: &cancellables)

// Enter states and get notified.
cgkStateMachine.enter(FirstState.self)
cgkStateMachine.enter(SecondState.self)

```
## Notice
Apple implemented a `publisher(for:)` on `NSObject`.  
This publisher allows for subscribing to KVO changes on classes that inherit from `NSObject`.

`GKStateMachine` inherits from `NSObject`.  
So in theory one could try using:

```swift
gkStateMachine.publisher(for: \.currentState).sink { state in
    ...
}
```
... however it doesn't seem that `GKStateMachine` is KVO-compliant.  
In my experience, with the above approach only the first state gets published.  

That's why `CGKStateMachine` was created.

## Integration
### Xcode
Use Xcode's [built-in support for SPM](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

*or...*

### Package.swift
In your `Package.swift`, add `CGKStateMachine` as a dependency:
```swift
dependencies: [
    .package(
        url: "https://github.com/thatfactory/cgkstatemachine",
        from: "0.1.0"
    )
]
```

Associate the dependency with your target:
```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(
                name: "CGKStateMachine",
                package: "cgkstatemachine"
            )
        ]
    )
]
```

Run: `swift build`

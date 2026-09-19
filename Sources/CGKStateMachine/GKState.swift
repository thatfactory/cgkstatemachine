import Combine
public import GameplayKit

/// Custom `GKState` subclass that publishes state changes.
///
/// Publishing is possible when its `stateMachine` property is of `CGKStateMachine` type.
open class CGKState: GKState {
    nonisolated public override func didEnter(from previousState: GKState?) {
        super.didEnter(from: previousState)
        publishState()
    }
}

// MARK: - Private

extension CGKState {
    /// Sends the entered state to the `CGKStateMachine.getter:publishedState` publisher.
    fileprivate func publishState() {
        let currentState = String(describing: stateMachine?.currentState)
        Task { @MainActor in
            CGKStateMachine.log("Did enter state: \(currentState)", category: .lifecycle)
        }
        (stateMachine as? CGKStateMachine)?.publishedState.send(self)
    }
}

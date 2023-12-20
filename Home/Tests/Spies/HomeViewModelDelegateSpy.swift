
@testable import Home
@testable import CorePokeDex
class HomeViewModelDelegateSpy: HomeViewModelDelegateProtocol {
    public var currentState: ViewControllerState?
    func homeEvent(state: ViewControllerState) {
        currentState = state
    }
}

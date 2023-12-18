
import CorePokeDex


public class HomeCoordinator: Coordinator {
    public var navigationController: UINavigationController?
    
    public init() {}
    
//    presentar el controlador - cambiar de vistas
    public func present(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
//    iniciar el controlador inicial
    public func start() {
        if let mainHomeScreen = HomeViewFactory.getFirstView() {
            mainHomeScreen.coordinator = self
            present(viewController: mainHomeScreen)
        }
    }
}




import UIKit
//import CoreEntities

public class HomeViewFactory {
    static let moduleBundle = Bundle(for: HomeViewFactory.self)

    public static func getFirstView() -> HomeViewController? {
        guard let homeViewController = UIStoryboard.init(
            name: "Home",
            bundle: moduleBundle
        ).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        else { return nil}
        return homeViewController
    }
    

}


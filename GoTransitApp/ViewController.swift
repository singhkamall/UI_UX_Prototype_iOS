import UIKit

class ViewController: UIViewController {
    // Private variables
    private var cellPointSize: CGFloat!
    private static let taskCell = "TaskName"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update color for navigactino bar
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let attrs = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        
        navigationController?.navigationBar.titleTextAttributes = attrs
        navigationController?.navigationBar.barStyle = UIBarStyle(rawValue: 1)!;
        
        // Modify the text for the default "Back Button" in the navigation bar
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil,  action: nil)
        
    }

}

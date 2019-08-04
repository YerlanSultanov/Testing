import Foundation
import UIKit


class ThirdVC: UIViewController {
    
    var userData = UserData()
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBAction func goBackButton(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }

    private func setupData() {
        userNameLabel.text = userData.username
        nameLabel.text = userData.name
        phoneLabel.text = userData.phone
        streetLabel.text = userData.street
        cityLabel.text = userData.city
        userImage.image = UIImage(named: "\(userData.id)")
    }
}

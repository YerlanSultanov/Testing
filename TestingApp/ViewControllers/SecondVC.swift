import Foundation
import UIKit


class SecondVC: UIViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    var filteredUsers = [UserData]()
    var userDataArray = realm.objects(UserData.self)
    var delegate: ModalDelegate?
    @IBOutlet weak var phoneOnlyButton: UIButton!
    @IBOutlet weak var emailOnlyButton: UIButton!
    var isPhoneOn = false
    var isEmailOn = false
    var phoneOnlyFilter = [UserData]()
    var emailOnlyFilter = [UserData]()
    @IBAction func closeButton(sender: UIButton) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addKeyboardSettings()
    }
    
    @IBAction func searchButtonDidTapped(sender: UIButton) {

        if isPhoneOn {
            filteredUsers += phoneOnlyFilter
        }
        if isEmailOn {
            filteredUsers += emailOnlyFilter
        }
        if (searchBar.text?.isEmpty)! {
            filteredUsers = Array(userDataArray)
        }
        delegate?.loadData(value: filteredUsers)
        dismiss(animated:true)

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                filteredUsers = userDataArray.filter({( userData : UserData) -> Bool in
                    return userData.username.lowercased().contains(searchText.lowercased())
                })
    }
    
    
    @IBAction func clearButtonDidTapped(sender: UIButton) {
        searchBar.text = ""
        phoneOnlyButton.backgroundColor = .white
        emailOnlyButton.backgroundColor = .white
        isPhoneOn = false
        isEmailOn = false
    }
    
    @IBAction func phoneOnlyButton(sender: UIButton) {
        isPhoneOn = !isPhoneOn
        
        if isPhoneOn {
            phoneOnlyButton.backgroundColor = .black
            for i in userDataArray {
                if !i.phone.isEmpty {
                    phoneOnlyFilter.append(i)
                }
            }
        } else {
            phoneOnlyButton.backgroundColor = .white
        }
        
    }
    
    @IBAction func emailOnly(sender: UIButton) {
        isEmailOn = !isEmailOn

        if isEmailOn {
            emailOnlyButton.backgroundColor = .black
            for i in userDataArray {
                if !i.email.isEmpty {
                    emailOnlyFilter.append(i)
                }
            }
        } else {
            emailOnlyButton.backgroundColor = .white
        }
        
    }
    
}

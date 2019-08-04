import Foundation
import UIKit

class TableViewVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataArray = [UserData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()

    }
}

extension TableViewVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

        cell.nameLabel.text = dataArray[indexPath.row].name
        cell.userImage.image = UIImage(named: "\(dataArray[indexPath.row].id)")
        cell.userNameLabel.text = dataArray[indexPath.row].username
        cell.emailLabel.text = dataArray[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ThirdVC") as! ThirdVC
        vc.userData = dataArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

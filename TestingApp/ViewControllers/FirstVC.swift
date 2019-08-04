import UIKit
import SwiftyJSON

protocol ModalDelegate {
    func loadData(value: [UserData])
}
class FirstVC: UIViewController,ModalDelegate {
    func loadData(value: [UserData]) {
        dataArray = value
        reloadData()
    }
    @IBOutlet weak var collectionViewContainer: UIView!
    @IBOutlet weak var tableViewContainer: UIView!

    var isTileContainerShowed = false
    let userDataArray = realm.objects(UserData.self)
    var dataArray = [UserData]()
    @IBAction func changeContainerButton(_ sender: Any) {
        if isTileContainerShowed {
            isTileContainerShowed = false
            tableViewContainer.isHidden = true
            collectionViewContainer.isHidden = false
        } else {
            isTileContainerShowed = true
            tableViewContainer.isHidden = false
            collectionViewContainer.isHidden = true
        }
    }
    
    @IBAction func openFilterVC(sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        vc.delegate = self
        present(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        

        updateDataContainers()
    }

    func reloadData() {
        let tvc : TableViewVC = self.children[1] as! TableViewVC
        tvc.dataArray = self.dataArray
        tvc.tableView.reloadData()
        tvc.viewWillAppear(true)
        let cvc : CollectionViewVC = self.children[0] as! CollectionViewVC
        cvc.dataArray = self.dataArray
        cvc.collectionView.reloadData()
        cvc.viewWillAppear(true)
    }

    
    private func updateDataContainers() {
        provider.request(MyServerApi.GetData, completion: { result in
            result.analysis(ifSuccess: { response in
                guard let json = try? JSON(data: response.data) else { return }
                
                for item in json.arrayValue {
                    let userData = UserData()
                    userData.id = item["id"].intValue
                    userData.name = item["name"].stringValue
                    userData.username = item["username"].stringValue
                    userData.city = item["address"]["city"].stringValue
                    userData.street = item["address"]["street"].stringValue
                    userData.phone = item["phone"].stringValue
                    userData.email = item["email"].stringValue
                    try! realm.write {
                        realm.add(userData,update: true)
                    }
                }
                self.dataArray = Array(self.userDataArray)
                self.reloadData()
                
            }, ifFailure: { error in
            })
        })
    }
   
}



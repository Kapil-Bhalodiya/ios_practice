
import UIKit

class ListFile: UIViewController {

    private let tblview = UITableView()
    private var Arrayfile = [String]()
    
    private let myToll : UIToolbar = {
        let tool = UIToolbar()
        let cancle = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(ClickedHome))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let item3 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ClickAdd))
        tool.items = [cancle,space,item3]
        return tool
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Notes"
        view.addSubview(tblview)
        view.addSubview(myToll)
        navigationController?.setNavigationBarHidden(true, animated: true)
        tblViewSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let toolBarHeight : CGFloat = view.safeAreaInsets.top + 30.0
        myToll.frame = CGRect(x: 0, y: 10, width: view.width, height: toolBarHeight)
        tblview.frame = CGRect(x: 0, y: myToll.bottom + 10, width: view.frame.width, height: view.frame.height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        Arrayfile=FileMangerService.getFIles()
        tblview.reloadData()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    @objc func ClickedHome(){
        let Home = LoginView()
        navigationController?.pushViewController(Home, animated: true)
    }
    
    @objc func ClickAdd(){
        UserDefaults.standard.setValue(nil, forKey: "listname")
        let add = ViewFile()
        navigationController?.pushViewController(add, animated: true)
    }
    
}
extension ListFile:UITableViewDelegate,UITableViewDataSource {
    
    func tblViewSetup(){
        tblview.delegate = self
        tblview.dataSource = self
        tblview.register(UITableViewCell.self, forCellReuseIdentifier: "FileCell")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Arrayfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileCell", for: indexPath)
        cell.textLabel?.text = Arrayfile[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Welcome \(UserDefaults.standard.string(forKey: "Email") ?? ""), Here Your Notes"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //UserDefaults.standard.setValue(empArray[indexPath.row], forKey: "listname")
        let add = ViewFile()
        add.fileget = Arrayfile[indexPath.row]
        navigationController?.pushViewController(add, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let filePath = FileMangerService.getDocDir().appendingPathComponent("\(Arrayfile[indexPath.row]).txt")
        do{
            try FileManager.default.removeItem(at: filePath)
            self.Arrayfile.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .automatic)
        }catch{
            print(error)
        }
    }
}

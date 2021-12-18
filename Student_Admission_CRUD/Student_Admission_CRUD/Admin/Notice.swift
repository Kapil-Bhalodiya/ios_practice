
import UIKit

class Notice: UIViewController {
    private let tblview = UITableView()
    private var noticeArray = [NoticeDB]()
    
    private let myToll : UIToolbar = {
        let tool = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        let item3 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ClickAdd))
        tool.items = [space,item3]
        return tool
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Admin"
        view.addSubview(tblview)
        view.addSubview(myToll)
        view.backgroundColor = .white
        tblViewSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolBarHeight : CGFloat = view.safeAreaInsets.top + 10.0
        myToll.frame = CGRect(x: 0, y: 20, width: view.width, height: toolBarHeight)
        tblview.frame = CGRect(x: 0, y: myToll.bottom + 10, width: view.frame.width, height: view.frame.height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        noticeArray = SQLiteHandler.sahred.fetchNote()
        tblview.reloadData()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func noticeClick(){
        let noticevc = Notice()
        navigationController?.pushViewController(noticevc, animated: true)
    }
    
    @objc func ClickAdd(){
        let register = AddNotice()
        navigationController?.pushViewController(register, animated: true)
    }
    
    
}
extension Notice:UITableViewDelegate,UITableViewDataSource {
    func tblViewSetup(){
        tblview.delegate = self
        tblview.dataSource = self
        tblview.register(UITableViewCell.self, forCellReuseIdentifier: "NoteCell")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        let note = noticeArray[indexPath.row]
        cell.textLabel?.text = "\(note.title) | \t  \(note.div)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //UserDefaults.standard.setValue(empArray[indexPath.row], forKey: "listname")
        let add = AddNotice()
        add.notice = noticeArray[indexPath.row]
        navigationController?.pushViewController(add, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
}

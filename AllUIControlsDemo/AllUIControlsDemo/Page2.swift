
import UIKit

class Page2: UIViewController {
    private let PickerData = ["Gujrat","Madhya Pradesh","Hariyana","Maharashtra","Uttar Pradesh","Bihar","TamilNadu","Keral"]
    
    private let myPicker = UIPickerView()
    
    private let imgPicker = UIImagePickerController()
    
    private let myToll : UIToolbar = {
        let tool = UIToolbar()
        let item1 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(ClickedHome))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let item2 = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(ClickSave))
        tool.items = [item1,space,item2]
        return tool
    }()
    
    private let imgView : UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.image = UIImage(named: "bg_UI")
        imgview.layer.cornerRadius = 50
        imgview.clipsToBounds = true
        return imgview
    }()
    
   
    
    private let UpBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Upload", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(Upload), for: .touchUpInside)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    private let imgpicker : UIImagePickerController = {
        let img = UIImagePickerController()
        img.allowsEditing = true
        return img
    }()
    
    private var PageContol : UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 2
        pc.backgroundColor = UIColor.red
        pc.currentPage = 1
        pc.tintColor = .gray
        return pc
    }()
    
    private let Titlelbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Register"
        lbl.textColor = .blue
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.font = UIFont(name: "Arial", size: 30)
        return lbl
    }()
    
    private let Nametxt: UITextField = {
        let name = UITextField()
        name.placeholder = "Enter Usename"
        name.textAlignment = .center
        name.layer.borderWidth = 0.3
        name.layer.cornerRadius = 10
        return name
    }()
    
    private let Emailtxt: UITextField = {
        let name = UITextField()
        name.placeholder = "Enter Email"
        name.textAlignment = .center
        name.layer.borderWidth = 0.3
        name.layer.cornerRadius = 10
        return name
    }()
    
    private let Passtxt: UITextField = {
        let name = UITextField()
        name.placeholder = "Enter PassWord"
        name.textAlignment = .center
        name.layer.borderWidth = 0.3
        name.layer.cornerRadius = 10
        return name
    }()
    
    private let stateView : UITextView = {
        let txtname = UITextView()
        txtname.text = "Sate :"
        txtname.font = UIFont.boldSystemFont(ofSize: 15)
        return txtname
    }()
    
    private let txtView : UITextView = {
        let txtname = UITextView()
        txtname.text = "DOB :"
        txtname.font = UIFont.boldSystemFont(ofSize: 15)
        return txtname
    }()
    
    private let mySegment : UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.insertSegment(withTitle: "Male", at: 0, animated: true)
        sc.insertSegment(withTitle: "Female", at: 1, animated: true)
        sc.insertSegment(withTitle: "Transgender", at: 2, animated: true)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    private let DatePicker : UIDatePicker = {
        let dp = UIDatePicker()
        dp.timeZone = NSTimeZone.local
        dp.datePickerMode = UIDatePicker.Mode.date
        return dp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(PageContol)
        view.addSubview(Nametxt)
        view.addSubview(Emailtxt)
        view.addSubview(Passtxt)
        view.addSubview(Titlelbl)
        view.addSubview(DatePicker)
        view.addSubview(txtView)
        view.addSubview(mySegment)
        view.addSubview(imgView)
        imgpicker.delegate = self
        view.addSubview(UpBtn)

        view.addSubview(myPicker)
        view.addSubview(stateView)
        myPicker.delegate = self
        myPicker.dataSource = self
        view.addSubview(myToll)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolBarHeight : CGFloat = view.safeAreaInsets.top + 50.0
        myToll.frame = CGRect(x: 0, y: 0, width: view.width, height: toolBarHeight)
        Titlelbl.frame = CGRect(x: 120, y: myToll.bottom + 20, width: view.width - 240, height: 40)
        imgView.frame = CGRect(x: 50, y: Titlelbl.bottom + 20, width: view.width - 200, height: 90)
        UpBtn.frame = CGRect(x: imgView.left + 200, y: Titlelbl.bottom + 60, width: view.width-300, height: 40)
        
        Nametxt.frame = CGRect(x: 30, y: UpBtn.bottom + 20, width: view.width-60, height: 40)
        Emailtxt.frame = CGRect(x: 30, y: Nametxt.bottom + 20, width: view.width-60, height: 40)
        Passtxt.frame = CGRect(x: 30, y: Emailtxt.bottom + 20, width: view.width-60, height: 40)
        txtView.frame = CGRect(x: 30, y: Passtxt.bottom + 20, width: 60, height: 70)
        DatePicker.frame = CGRect(x: txtView.left+30, y: Passtxt.bottom + 10, width:view.width-50, height: 60)
        mySegment.frame = CGRect(x: 20, y: DatePicker.bottom+20, width: view.width-40, height: 50)
        stateView.frame = CGRect(x: 30, y: mySegment.bottom + 30, width: 60, height: 70)
        myPicker.frame = CGRect(x: 50, y: mySegment.bottom + 20, width: view.width - 100, height: 50)
        
        PageContol.frame = CGRect(x: 100, y: view.safeAreaInsets.top - view.safeAreaInsets.bottom, width: view.width - 200, height: 30)
    }
    
    @objc func Upload(){
        imgpicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imgpicker, animated: true)
        }
    }
    
    @objc func ClickedHome(){
        let P1 = Page1()
       navigationController?.pushViewController(P1, animated: true)
        present(P1, animated: true, completion: nil)
    }
    
    @objc func ClickSave(){
        let P3 = Page3()
        navigationController?.pushViewController(P3, animated: true)
        present(P3, animated: true, completion: nil)
    }
}

extension Page2 : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let getImage = info[.originalImage] as? UIImage{
            imgView.image = getImage
        }
        imgpicker.dismiss(animated: true)
    }
}
extension Page2 : UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PickerData[row]
    }
}

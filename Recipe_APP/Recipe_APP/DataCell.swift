import UIKit

class DataCell: UITableViewCell {
    private let myimgview:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.layer.cornerRadius = 20
        imgview.clipsToBounds = true
        return imgview
    }()

    private let title:UILabel={
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize:20)
        return lbl
    }()
    
    private let content:UILabel={
        let lbl = UILabel()
        return lbl
    }()
    
    func setUpDataCell(title name:String,content con:String){
        contentView.addSubview(myimgview)
        contentView.addSubview(title)
        contentView.addSubview(content)
        myimgview.frame = CGRect(x:20,y:20,width: 80,height: 100)
        title.frame = CGRect(x:myimgview.right + 20 , y:50,width: 200,height: 20)
        content.frame = CGRect(x:myimgview.right + 20, y:20,width: 200,height: contentView.height)
        myimgview.image = UIImage(named: name)
        title.text = name
        content.text = con
    }
}


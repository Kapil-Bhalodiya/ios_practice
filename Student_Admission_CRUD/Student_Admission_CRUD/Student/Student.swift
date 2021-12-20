
import Foundation

class Student {
    var spid : Int = 0
    var uname : String = ""
    var gender : String = ""
    var email : String = ""
    var password : String = ""
    var div : String = ""
    var dob : String = ""
    

init(spid:Int,uname:String,gender:String,email:String,password:String,div:String,dob:String) {
        self.spid = spid
        self.uname = uname
        self.gender = gender
        self.email = email
        self.password = password
        self.div = div
        self.dob = dob
    }
}

import Foundation
import SQLite3

class SQLiteHandler {
    
    static let sahred = SQLiteHandler()
    
    let dbPath = "student.sqlite"
    var db:OpaquePointer?
    
    private init(){
        db = openDatabase()
        createTable()
    }
    
    func openDatabase() -> OpaquePointer? {
        let docUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = docUrl.appendingPathComponent(dbPath)
        
        var database:OpaquePointer? = nil
        
        if sqlite3_open(fileUrl.path, &database) == SQLITE_OK{
            print("Open Connection is Success at : \(fileUrl)")
            return database
        }else{
            print("error to connect db")
            return nil
        }
    }
    
    func createTable(){
        
        let createTblString = """
        
        CREATE TABLE IF NOT EXISTS stud(
            spid PRIMARY KEY,
            uname TEXT,
            gender TEXT,
            email TEXT,
            password TEXT,
            div CHAR,
            dob DATE
        );
        """
        
        var createTblStatement:OpaquePointer? = nil
        
        
        //Prapare Statement
        if sqlite3_prepare_v2(db, createTblString, -1, &createTblStatement, nil) == SQLITE_OK {
            
            //Evalute Statement
            if sqlite3_step(createTblStatement) == SQLITE_DONE {
                print("Tbl Created")
            }else{
                print("Not created")
            }
        }else{
            print("Tbl not Prepared")
        }
        
        //delete Satement
        sqlite3_finalize(createTblStatement)
        
         let createTblStringnote = """
        
            CREATE TABLE IF NOT EXISTS notice(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            desc TEXT,
            div CHAR,
            don String
            );
        """
        
        var createTblStatementnote:OpaquePointer? = nil
        
        
        //Prapare Statement
        if sqlite3_prepare_v2(db, createTblStringnote, -1, &createTblStatementnote, nil) == SQLITE_OK {
            
            //Evalute Statement
            if sqlite3_step(createTblStatement) == SQLITE_DONE {
                print("note Tbl Created")
            }else{
                print("note Not created")
            }
        }else{
            print("note Tbl not Prepared")
        }
        
    }
    
    
    func insert(stud:Student, completion: @escaping ((Bool) -> Void)){
        let insStatementString = "INSERT INTO stud(spid,uname,gender,email,password,div,dob) VALUES(?,?,?,?,?,?,?);"
        
        var insStatement:OpaquePointer? = nil
        
        //Prapare Statement
        if sqlite3_prepare_v2(db, insStatementString, -1, &insStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(insStatement, 1, Int32(Int64(stud.spid)))
            sqlite3_bind_text(insStatement, 2, (stud.uname as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insStatement, 3, (stud.gender as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insStatement, 4, (stud.email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insStatement, 5, (stud.password as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insStatement, 6, (stud.div as NSString).utf8String, -1, nil)
            sqlite3_bind_double(insStatement, 7, stud.dob.timeIntervalSinceReferenceDate)
            //Evalute Statement
            if sqlite3_step(insStatement) == SQLITE_DONE {
                print("data inserted")
                completion(true)
            }else{
                print("Not inserted")
                completion(false)
            }
            
        }else{
            print("Ins not Prepared")
        }
        sqlite3_finalize(insStatement)
    }
    
    
    func update(stud:Student, completion: @escaping ((Bool) -> Void)){
        let upStatementString = "UPDATE stud SET uname = ? ,gender = ?,email = ?,password= ?,div= ?,dob= ? WHERE spid = ?;"

        var upStatement:OpaquePointer? = nil

        //Prapare Statement
        if sqlite3_prepare_v2(db, upStatementString, -1, &upStatement, nil) == SQLITE_OK {

            
            sqlite3_bind_text(upStatement, 1, (stud.uname as NSString).utf8String, -1, nil)
            sqlite3_bind_text(upStatement, 2, (stud.gender as NSString).utf8String, -1, nil)
            sqlite3_bind_text(upStatement, 3, (stud.email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(upStatement, 4, (stud.password as NSString).utf8String, -1, nil)
            sqlite3_bind_text(upStatement, 5, (stud.div as NSString).utf8String, -1, nil)
            sqlite3_bind_double(upStatement, 6, stud.dob.timeIntervalSinceReferenceDate)
            sqlite3_bind_int(upStatement, 7, Int32(Int64(stud.spid)))
            //Evalute Statement
            if sqlite3_step(upStatement) == SQLITE_DONE {
                print("update")
                completion(true)
            }else{
                print("Not update")
                completion(false)
            }

        }else{
            print("up not Prepared")
        }
        sqlite3_finalize(upStatement)
    }
//
//
    func delete(for spid:Int, completion: @escaping ((Bool) -> Void)){
        let delStatementString = "DELETE from stud WHERE spid = ?;"

        var delStatement:OpaquePointer? = nil

        //Prapare Statement
        if sqlite3_prepare_v2(db, delStatementString, -1, &delStatement, nil) == SQLITE_OK {

            sqlite3_bind_int(delStatement, 1, Int32(spid))

            //Evalute Statement
            if sqlite3_step(delStatement) == SQLITE_DONE {
                print("Delete")
                completion(true)
            }else{
                print("Not Delete")
                completion(false)
            }

        }else{
            print("del not Prepared")
        }
        sqlite3_finalize(delStatement)
    }
//
    
    func fetch() -> [Student] {
        let fetchStatementString = "SELECT * from stud;"

        var fetchStatement:OpaquePointer? = nil

        var emp = [Student]()
        //Prapare Statement
        if sqlite3_prepare_v2(db, fetchStatementString, -1, &fetchStatement, nil) == SQLITE_OK {

            //Evalute Statement
            while sqlite3_step(fetchStatement) == SQLITE_ROW {
                let spid = Int(sqlite3_column_int(fetchStatement, 0))
                let uname = String(cString: sqlite3_column_text(fetchStatement, 1))
                let gender = String(cString: sqlite3_column_text(fetchStatement, 2))
                let email = String(cString: sqlite3_column_text(fetchStatement, 3))
                let password = String(cString: sqlite3_column_text(fetchStatement, 4))
                let div = String(cString: sqlite3_column_text(fetchStatement, 5))
                let dob = Date(timeIntervalSinceReferenceDate:sqlite3_column_double(fetchStatement, 6))
                
                emp.append(Student(spid: spid, uname: uname, gender: gender, email: email, password: password, div: div, dob: dob))
                print("get")
            }
        }
        else
        {
            print("Not get")
        }
        sqlite3_finalize(fetchStatement)
        return emp
    }
    
   //CheckAuth
    
    func checkAuth(for spid:Int,for password:String,completion: @escaping ((Bool) -> Void)) -> [String] {
        let checkString = "SELECT uname from stud where spid = ? and password = ?;"
        var checkStatement:OpaquePointer? = nil
        var user = ""
        
        if sqlite3_prepare_v2(db, checkString, -1, &checkStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(checkStatement, 1, Int32(spid))
            sqlite3_bind_text(checkStatement, 2, (password as NSString).utf8String, -1, nil)
            //Evalute Statement
            if sqlite3_step(checkStatement) == SQLITE_DONE {
                user = String(cString: sqlite3_column_text(checkStatement, 1))
                print(user)
                print("Authenticate")
                completion(true)
            }else{
                user = ""
                print("Not Auth")
                completion(false)
            }
            
        }
        return [user]
    }

    
// Notice
    
    func insertNote(note:NoticeDB, completion: @escaping ((Bool) -> Void)){
        let insStatementString = "INSERT INTO notice(title,desc,div,don) VALUES(?,?,?,?);"
        
        var insStatement:OpaquePointer? = nil
        
        //Prapare Statement
        if sqlite3_prepare_v2(db, insStatementString, -1, &insStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_text(insStatement, 1, (note.title as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insStatement, 2, (note.desc as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insStatement, 3, (note.div as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insStatement, 4, (note.don as NSString).utf8String, -1, nil)
            //Evalute Statement
            if sqlite3_step(insStatement) == SQLITE_DONE {
                print("Note inserted")
                completion(true)
            }else{
                print("Note Not inserted")
                completion(false)
            }
            
        }else{
            print("Ins Note not Prepared")
        }
        sqlite3_finalize(insStatement)
    }
    
    //update notice
    
    func updateNote(note:NoticeDB, completion: @escaping ((Bool) -> Void)){
        let insStatementString = "UPDATE notice set title = ?,desc = ?,div = ?,don = ? where id=?;"
        
        var insStatement:OpaquePointer? = nil
        
        //Prapare Statement
        if sqlite3_prepare_v2(db, insStatementString, -1, &insStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_text(insStatement, 1, (note.title as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insStatement, 2, (note.desc as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insStatement, 3, (note.div as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insStatement, 4, (note.don as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insStatement, 5, Int32(note.id))
            //Evalute Statement
            if sqlite3_step(insStatement) == SQLITE_DONE {
                print("Note Updated")
                completion(true)
            }else{
                print("Note Not Updated")
                completion(false)
            }
            
        }else{
            print("UP Note not Prepared")
        }
        sqlite3_finalize(insStatement)
    }
    
    //fetch notes
    
    func fetchNote() -> [NoticeDB] {
        let fetchStatementString = "SELECT * from notice;"
        
        var fetchStatement:OpaquePointer? = nil
        
        var note = [NoticeDB]()
        //Prapare Statement
        if sqlite3_prepare_v2(db, fetchStatementString, -1, &fetchStatement, nil) == SQLITE_OK {
            
            //Evalute Statement
            while sqlite3_step(fetchStatement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(fetchStatement, 0))
                let title = String(cString: sqlite3_column_text(fetchStatement, 1))
                let desc = String(cString: sqlite3_column_text(fetchStatement, 2))
                let div = String(cString: sqlite3_column_text(fetchStatement, 3))
                let don = String(cString: sqlite3_column_text(fetchStatement, 4))
                
                note.append(NoticeDB(id: id, title: title, desc: desc, div: div, don: don))
                print("get")
            }
        }
        else
        {
            print("Not get")
        }
        sqlite3_finalize(fetchStatement)
        return note
    }
    
    //delte noitice
    func deleteNote(for spid:Int, completion: @escaping ((Bool) -> Void)){
        let delStatementString = "DELETE from notice WHERE id = ?;"
        
        var delStatement:OpaquePointer? = nil
        
        //Prapare Statement
        if sqlite3_prepare_v2(db, delStatementString, -1, &delStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(delStatement, 1, Int32(spid))
            
            //Evalute Statement
            if sqlite3_step(delStatement) == SQLITE_DONE {
                print("Delete")
                completion(true)
            }else{
                print("Not Delete")
                completion(false)
            }
            
        }else{
            print("del not Prepared")
        }
        sqlite3_finalize(delStatement)
    }
    
    
    //get notice
    
    func fetchStud() -> [NoticeDB] {
        let fetchStatementString = "SELECT * FROM notice WHERE div='A';"
        
        var fetchStatement:OpaquePointer? = nil
        
        var note = [NoticeDB]()
        //Prapare Statement
        if sqlite3_prepare_v2(db, fetchStatementString, -1, &fetchStatement, nil) == SQLITE_OK {
            
            //sqlite3_bind_text(fetchStatement, 1, "A", -1, nil)
            //Evalute Statement
            while sqlite3_step(fetchStatement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(fetchStatement, 0))
                let title = String(cString: sqlite3_column_text(fetchStatement, 1))
                let desc = String(cString: sqlite3_column_text(fetchStatement, 2))
                let div = String(cString: sqlite3_column_text(fetchStatement, 3))
                let don = String(cString: sqlite3_column_text(fetchStatement, 4))
                
                note.append(NoticeDB(id: id, title: title, desc: desc, div: div, don: don))
                print("get division ")
            }
        }
        else
        {
            print("Not get dividion")
        }
        sqlite3_finalize(fetchStatement)
        return note
    }
    
    
    func fetchDetail() -> [Student] {
        let fetchStatementString = "SELECT * from stud WHERE SPID=20211;"
        
        var fetchStatement:OpaquePointer? = nil
        
        var detail = [Student]()
        //Prapare Statement
        if sqlite3_prepare_v2(db, fetchStatementString, -1, &fetchStatement, nil) == SQLITE_OK {
            
            //Evalute Statement
            while sqlite3_step(fetchStatement) == SQLITE_ROW {
                let spid = Int(sqlite3_column_int(fetchStatement, 0))
                let uname = String(cString: sqlite3_column_text(fetchStatement, 1))
                let gender = String(cString: sqlite3_column_text(fetchStatement, 2))
                let email = String(cString: sqlite3_column_text(fetchStatement, 3))
                let password = String(cString: sqlite3_column_text(fetchStatement, 4))
                let div = String(cString: sqlite3_column_text(fetchStatement, 5))
                let dob = Date(timeIntervalSinceReferenceDate:sqlite3_column_double(fetchStatement, 6))
                
                detail.append(Student(spid: spid, uname: uname, gender: gender, email: email, password: password, div: div, dob: dob))
                print("get")
            }
        }
        else
        {
            print("Not get")
        }
        sqlite3_finalize(fetchStatement)
        return detail
    }
    
}

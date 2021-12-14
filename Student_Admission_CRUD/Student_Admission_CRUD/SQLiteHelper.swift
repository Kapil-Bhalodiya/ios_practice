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
//    func delete(for id:Int, completion: @escaping ((Bool) -> Void)){
//        let delStatementString = "DELETE from emp WHERE id = ?;"
//
//        var delStatement:OpaquePointer? = nil
//
//        //Prapare Statement
//        if sqlite3_prepare_v2(db, delStatementString, -1, &delStatement, nil) == SQLITE_OK {
//
//            sqlite3_bind_int(delStatement, 1, Int32(id))
//
//            //Evalute Statement
//            if sqlite3_step(delStatement) == SQLITE_DONE {
//                print("Delete")
//                completion(true)
//            }else{
//                print("Not Delete")
//                completion(false)
//            }
//
//        }else{
//            print("del not Prepared")
//        }
//        sqlite3_finalize(delStatement)
//    }
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
}

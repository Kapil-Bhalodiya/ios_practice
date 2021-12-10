//
//  SQLiteHandler.swift
//  CRUD_Notes
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import SQLite3

class SQLiteHandler {
    
    static let sahred = SQLiteHandler()
    
    let dbPath = "empdb1.sqlite"
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
        
        CREATE TABLE IF NOT EXISTS emp(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INTEGER,
            phone TEXT
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
    
    func insert(emp:Employee, completion: @escaping ((Bool) -> Void)){
        let insStatementString = "INSERT INTO emp(name,age,phone) VALUES(?,?,?);"
        
        var insStatement:OpaquePointer? = nil
        
        //Prapare Statement
        if sqlite3_prepare_v2(db, insStatementString, -1, &insStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_text(insStatement, 1, (emp.name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insStatement, 2, Int32(emp.age))
            sqlite3_bind_text(insStatement, 3, (emp.phone as NSString).utf8String, -1, nil)
            
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
    
    func update(emp:Employee, completion: @escaping ((Bool) -> Void)){
        let upStatementString = "UPDATE emp SET name = ? ,age = ?,phone = ? WHERE id = ?;"
        
        var upStatement:OpaquePointer? = nil
        
        //Prapare Statement
        if sqlite3_prepare_v2(db, upStatementString, -1, &upStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_text(upStatement, 1, (emp.name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(upStatement, 2, Int32(emp.age))
            sqlite3_bind_text(upStatement, 3, (emp.phone as NSString).utf8String, -1, nil)
            sqlite3_bind_int(upStatement, 4, Int32(emp.id))
            
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
    
    
    func delete(for id:Int, completion: @escaping ((Bool) -> Void)){
        let delStatementString = "DELETE from emp WHERE id = ?;"
        
        var delStatement:OpaquePointer? = nil
        
        //Prapare Statement
        if sqlite3_prepare_v2(db, delStatementString, -1, &delStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(delStatement, 1, Int32(id))
            
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
    
    func fetch() -> [Employee] {
        let fetchStatementString = "SELECT * from emp;"
        
        var fetchStatement:OpaquePointer? = nil
        
        var emp = [Employee]()
        //Prapare Statement
        if sqlite3_prepare_v2(db, fetchStatementString, -1, &fetchStatement, nil) == SQLITE_OK {
            
            //Evalute Statement
            while sqlite3_step(fetchStatement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(fetchStatement, 0))
                let name = String(cString: sqlite3_column_text(fetchStatement, 1))
                let age = Int(sqlite3_column_int(fetchStatement, 2))
                let phone = String(cString: sqlite3_column_text(fetchStatement, 3))
                
                emp.append(Employee(id: id, name: name, age: age, phone: phone))
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

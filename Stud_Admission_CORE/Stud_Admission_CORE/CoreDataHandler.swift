//
//  CoreDataHandler.swift
//  Student_Admission_CORE
//
//  Created by DCS on 22/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class CoreDataHandler {
    static let shared = CoreDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedObjectContext : NSManagedObjectContext?
    
    private init(){
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func save(){
        appDelegate.saveContext()
    }
    
    func insert(spid:Int, gender: String, email:String, password:String, uname:String, div:String, dob:String,completion: @escaping((Bool) -> Void)){
        let stud = Student(context: managedObjectContext!)
        
        stud.uname = uname
        stud.spid = Int32(spid)
        stud.gender = gender
        stud.email = email
        stud.password = password
        stud.div = div
        stud.dob = dob
        
        save()
        completion(true)
    }
    
    func Auth(spid:Int,password:String)-> [Student]{
        var getdata = [Student]()
        let fetchRequest:NSFetchRequest = Student.fetchRequest()
        let spidcpredict = NSPredicate(format: "spid contains %i", spid)
        
        let passcpredict = NSPredicate(format: "password contains %@", password)
        let both = NSCompoundPredicate(andPredicateWithSubpredicates: [spidcpredict,passcpredict] )
        fetchRequest.predicate = both
        
        do{
            getdata = try (managedObjectContext?.fetch(fetchRequest))!
            print(getdata.count)
            return getdata
        }catch{
            print("Error")
            return getdata
        }
    }
    
    func updateStud(stud:Student,spid:Int, gender: String, email:String, password:String, uname:String, div:String, dob:String){
        
        stud.uname = uname
        stud.spid = Int32(spid)
        stud.gender = gender
        stud.email = email
        stud.password = password
        stud.div = div
        stud.dob = dob
        
        save()
    }
    //func update(stud: Student,name: String, age:Int, phone:String, completion: @escaping () -> Void){
    
    //        emp.name = name
    //        emp.age = Int64(age)
    //        emp.phone = phone
    //
    //        save()
    //        completion()
    //}
    
    func delete(emp: Student, completion: @escaping () -> Void){
        managedObjectContext!.delete(emp)
        save()
        completion()
    }
    
    func fetchStud() -> [Student] {
        let fetchRequest:NSFetchRequest = Student.fetchRequest()
        //let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        do{
            let studArray = try managedObjectContext?.fetch(fetchRequest)
            return studArray!
        }catch{
            return [Student]()
        }
    }
    
    //Notice
    
    func insertNote(title: String,desc:String,div:String,don:String){
        let insNote = NoticeDB(context: managedObjectContext!)
        insNote.title = title
        insNote.desc = desc
        insNote.div = div
        insNote.don = don
        
        save()
        print("Note Inserted..!")
    }
    
    func fetchNote() -> [NoticeDB] {
        print("asd")
        let fetchRequest:NSFetchRequest = NoticeDB.fetchRequest()
        do{
            let noteArray = try managedObjectContext?.fetch(fetchRequest)
            return noteArray!
        }catch{
            return [NoticeDB]()
        }
    }
}

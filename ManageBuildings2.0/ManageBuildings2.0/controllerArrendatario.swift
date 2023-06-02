//
//  controllerArrendatario.swift
//  manageBuildings
//
//  Created by wrichy on 9/5/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import UIKit
import FirebaseDatabase
class controllerArrendatario: UIViewController, UITableViewDataSource, UITableViewDelegate {

   // var arr:Int64?
    var arrendatario: [Arrendatarios]? = []
    var arren = String()
   // var arrendatario: [Arrendatarios] = DBManager.shared.queryAllArrendatarios()
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        cargar()
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        databaseHandle = ref?.child("clientes").observe(.childAdded, with: { (snapshot) in
            let data1 = snapshot.value as? NSDictionary
            
            let nuevo = Arrendatarios(id: snapshot.key, nombre: data1?["nombre"] as? String ?? "",apPat: data1?["apPat"] as? String ?? "",apMat: data1?["apMat"] as? String ?? "",correo: data1?["correo"] as? String ?? "", tel: data1?["tel"] as? String ?? "")
            
            self.arrendatario?.append(nuevo)
            self.tableView.reloadData()
          
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return apartments.count
        return self.arrendatario!.count
       // return 1
    }
    
     @IBOutlet var tableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
           self.tableView.reloadData()

       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lblArrendatarios", for: indexPath)
        //var apartments : [Apartments] = DBManager.shared.queryAllApts()
     //  cell.textLabel?.text = arrendatario[indexPath.row].description
     //   let selectedCell = tableView.cellForRow(at: indexth)!
        
        
        cell.textLabel?.text = arrendatario?[indexPath.row].description
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let cell = tableView.cellForRow(at: arrendatario[indexPath.row].description)
        let indice = indexPath.row
        
        arren = arrendatario?[indice].idArr ?? ""
    
        
      performSegue(withIdentifier: "segueUpdate", sender: self)
       
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if(segue.identifier == "segueUpdate"){
        let dest = segue.destination as! controllerUpdateArrendatario
            dest.idValue = arren
            //print("\(arr)")
        }
    }
    
    @IBOutlet var btnAgreArr: UIButton!
    
    func cargar(){
        btnAgreArr.setIcon(prefixText: "++", prefixTextColor: .white, icon: .linearIcons(.users), iconColor: .white,postfixText: "",  forState: .normal, iconSize: 25)
        btnAgreArr.layer.borderWidth = 2
        btnAgreArr.layer.borderColor = UIColor.white.cgColor
        btnAgreArr.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnAgreArr.layer.cornerRadius = 10
        btnAgreArr.clipsToBounds = true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

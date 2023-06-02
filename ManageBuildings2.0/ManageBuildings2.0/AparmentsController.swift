//
//  AparmentsController.swift
//  manageBuildings
//
//  Created by wrichy on 9/4/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import UIKit
import FirebaseDatabase
class AparmentsController: UIViewController, UITableViewDataSource, UITableViewDelegate{
//var autos = ["audi", "ford", "chevrolet","BMW","Bugatti"]
    
    var keys = [String]()
    var data = [String]()
    var apt = String()
 
   var apartments : [Apartments]? = []

   var ref:DatabaseReference?
    var dataBaseHandle:DatabaseHandle?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        cargar()
        ref = Database.database().reference();
        dataBaseHandle = ref?.child("aptID1").observe(.childAdded, with: { (snapshot) in
       
        
        let data1 = snapshot.value as? NSDictionary
      
        let nuevo = Apartments(id: snapshot.key,calle: data1?["calle"] as? String ?? "", numero: data1?["numero"] as? String ?? "",ciudad: data1?["ciudad"] as? String ?? "",estado: data1?["estado"] as? String ?? "",codigo: data1?["codigo"] as? Int ?? 0,
            ocupado: false)
        
       
       // print(nuevo.getId)
        self.apartments?.append(nuevo)
        
       
        self.tableView.reloadData()
        
            
        })
       
        
       // print(apartments?.count)
       
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //self.tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // apartments = DBManager.shared.queryAllApts()
        //print(apartments!.count)
        return apartments!.count
        
       // return data.count
    }
    
    
   /*  func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }*/
    
    
    @IBOutlet var tableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lblApartment", for: indexPath)
        
        // Configure the cell...
        
        //cell.textLabel?.text=autos[indexPath.row]
        //let userdefault = UserDefaults.standard
        
        cell.textLabel?.text=apartments?[indexPath.row].description
        
        
        
        
        return cell
    }
    
   
    /*
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lblApartment", for: indexPath)
        //var apartments : [Apartments] = DBManager.shared.queryAllApts()
       // cell.textLabel?.text = apartments?[indexPath.row].description
        cell.textLabel?.text = calle
        return cell
    }
  */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let cell = tableView.cellForRow(at: arrendatario[indexPath.row].description)
        let indice = indexPath.row
        
        apt = apartments?[indice].getId ?? ""
        
        
        performSegue(withIdentifier: "modApt", sender: self)
        
        
    }
   
    
    @IBOutlet var btnAgregarApt: UIButton!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "modApt"){
           
            
            let destino = segue.destination as! controllerUpdateApartment
             destino.idValue = apt
        }
    }
    
    func cargar(){
        btnAgregarApt.setIcon(prefixText: "++", prefixTextColor: .white, icon: .linearIcons(.apartment), iconColor: .white,postfixText: "",  forState: .normal, iconSize: 25)
        btnAgregarApt.layer.borderWidth = 2
        btnAgregarApt.layer.borderColor = UIColor.white.cgColor
        btnAgregarApt.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnAgregarApt.layer.cornerRadius = 10
        btnAgregarApt.clipsToBounds = true
      
    
    }
    /*
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
     
    }*/


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  controllerManageContrato.swift
//  manageBuildings
//
//  Created by wrichy on 9/11/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import UIKit
import FirebaseDatabase
class controllerManageContrato: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
//var arr:Int64?
    
    //var arrendatario: [Arrendatarios] = DBManager.shared.queryAllArrendatarios()

    var ctra:String = ""
    var contratosLista : [listaContratos]? = []
    var ref:DatabaseReference?
    var dataBaseHandler:DatabaseHandle?
    var calle:String = ""
    var numero:String = ""
    var ciudad:String = ""
    var nombre:String = ""
    var apPat:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        cargar()
      
        ref = Database.database().reference()
        dataBaseHandler = ref?.child("contrato").observe(.childAdded, with: { (snapshot) in
            let data1 = snapshot.value as? NSDictionary
        
            
            
            let nuevo = listaContratos(apt_id: data1?["aptId"] as? String ?? "", arr_id: data1?["arrenId"] as? String ?? "", id_cont:  snapshot.key, fechaIni: data1?["fechaIn"] as? String ?? "", fechaFin: data1?["fechaFin"] as? String ?? "", renta: data1?["monto"] as? Double ?? 0.0,nombre: data1?["nombre"] as? String ?? "",apPat: data1?["apPat"] as? String ?? "", apMat: data1?["apMat"] as? String ?? "", calle: data1?["calle"] as? String ?? "", numero: data1?["numero"] as? String ?? "", ciudad: data1?["ciudad"] as? String ?? "")
            
            self.contratosLista?.append(nuevo)
            self.tblContrato.reloadData();
            })
            
           
            
        
            
            
          
            
            
           
           
            
            
            

        
       
    }
    
   
    
    /*
    func iteration1(aptIDs: String){
        //print("------ This is the iteration ----")
        
        self.ref?.child(aptIDs).observeSingleEvent(of: .value, with: { (DataSnapshot1) in
            let data3 = DataSnapshot1.value as? NSDictionary
                              //    print(data3)
            self.calle.append(data3?["calle"] as? String ?? "")
            self.numero = data3?["numero"] as? String ?? ""
            self.ciudad = data3?["ciudad"] as? String ?? ""
            //print(self.calle)
           // print(self.calle.count)
           // self.iteration(caishe: self.calle)
        })
       // for contract in contratosLista! {
            
        //    print("aptID: \(contract.apt_id) , nombre: \(caishe)")
       // }
        
        
    }
    
    func Iteration2(arrenId: String){
        
        // print(arr1)
         self.ref?.child(arrenId).observeSingleEvent(of: .value, with: { (DataSnapshot) in
         
             
             
         let data2 = DataSnapshot.value as? NSDictionary
                      //  print(data2)
             self.nombre.append( data2?["nombre"] as? String ?? "")
             self.apPat = data2?["apPat"] as? String ?? ""
             //print(self.nombre)
        })
         
        //print(nombre.count)
        
    }
    
    func finalIterato(){
        print("asfsfasf")
        print(nombre.count)
        for i in 0 ..< nombre.count {
            print(nombre[i] + " " + calle[i])
            let nuevo = listaContratos(nombre: nombre[i], calle: calle[i])
            contratosLista?.append(nuevo)
        }
        
        
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  contratosLista = DBManager.shared.getContratos()
        //return apartments.count
        return contratosLista!.count
       // return 1
    }
    
    @IBOutlet var tblContrato: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        self.tblContrato.reloadData()
    }
    
    @IBOutlet var btnAgreContr: UIButton!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lblContratos", for: indexPath)
        //var apartments : [Apartments] = DBManager.shared.queryAllApts()
        cell.textLabel?.text = contratosLista?[indexPath.row].description
        //   let selectedCell = tableView.cellForRow(at: indexPath)!
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let cell = tableView.cellForRow(at: arrendatario[indexPath.row].description)
        let indice = indexPath.row
        
        ctra = contratosLista?[indice].getID ?? ""
        
        
        performSegue(withIdentifier: "updateContrato", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "updateContrato"){
            let dest = segue.destination as! controllerUpdateContrato
            dest.idContra = ctra
            //dest.idValue = arr
            //print("\(arr)")
        }
    }
    
    func cargar(){
        btnAgreContr.setIcon(prefixText: "++", prefixTextColor: .white, icon: .linearIcons(.pencil), iconColor: .white,postfixText: "",  forState: .normal, iconSize: 20)
        btnAgreContr.layer.borderWidth = 2
        btnAgreContr.layer.borderColor = UIColor.white.cgColor
        btnAgreContr.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnAgreContr.layer.cornerRadius = 10
        btnAgreContr.clipsToBounds = true
        
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

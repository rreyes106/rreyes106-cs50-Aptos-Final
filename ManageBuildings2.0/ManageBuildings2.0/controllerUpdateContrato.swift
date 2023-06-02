//
//  controllerUpdateContrato.swift
//  manageBuildings
//
//  Created by wrichy on 9/13/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class controllerUpdateContrato: UIViewController {
    
    var idContra:String?
    var contratosLista : [listaContratos]? = []
    var ref:DatabaseReference?
    var dataBaseHandler:DatabaseHandle?
   var new = ""
    var contra:listaContratos?
    // var ContraUp:[listaContratos]?
    override func viewDidLoad(){
        super.viewDidLoad()
        
        new = "contrato/"+(idContra ?? "")
        print(new)
        ref = Database.database().reference();
        ref?.child(new).observeSingleEvent(of: .value, with: { (snapshot) in
                   let data1 = snapshot.value as? NSDictionary
               
           // print(data1)
            let lugar1 = data1?["calle"] as? String ?? ""
            let lugar2 = data1?["numero"] as? String ?? ""
            self.txtlugar.text = lugar1 + " " + lugar2;
                self.txtNombre.text = data1?["nombre"] as? String ?? ""
                
            
            self.txtNombre.isEnabled = true;
                   
            self.contra = listaContratos(apt_id:data1?["aptId"] as? String ?? "", arr_id: data1?["arrenId"] as? String ?? "", id_cont: snapshot.key, fechaIni: data1?["fechaIn"] as? String ?? "", fechaFin: data1?["fechaFin"] as? String ?? "", renta: data1?["monto"] as? Double ?? 0.0, nombre: data1?["nombre"] as? String ?? "", apPat: data1?["apPat"] as? String ?? "", apMat: data1?["apMat"] as? String ?? "", calle: data1?["calle"] as? String ?? "", numero: data1?["numero"] as? String ?? "", ciudad: data1?["ciudad"] as? String ?? "" );
            
            self.txtFechaFin.text = data1?["fechaFin"] as? String ?? ""
            self.txtRenta.text = String(data1?["monto"] as? Double ?? 0.0)
            self.txtFechaIni.text = data1?["fechaIn"] as? String ?? ""
            //agregar(contrato: contra)
                    
                   })
        
      //  ContraUp = DBManager.shared.getContrato(idContrato: idContra!)
        
        /*txtlugar.text = ContraUp?[0].getDireccion
        txtNombre.text = ContraUp?[0].getNombre
        let renta = ContraUp?[0].getRenta
        let renta2:String = String(format:"%.2f", renta!)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short*/
        // let fechaInic = dateFormatter.string(from: (ContraUp?[0].getFechaini)!)
        //let fechaFina = dateFormatter.string(from: (ContraUp?[0].getFechafin)! )
        //let renta2 = "\(renta)"
          
        //rellenar
        //txtFechaIni.text = fechaInic
        //txtFechaFin.text = fechaFina
        
        /*txtlugar.isUserInteractionEnabled = false
        txtNombre.isUserInteractionEnabled = false
        txtFechaFin.isUserInteractionEnabled = false
        txtFechaIni.isUserInteractionEnabled = false
        txtRenta.text = renta2*/
        cargar()
        
        // Do any additional setup after loading the view.
    }

    @IBOutlet var btnDelCont: UIButton!
    @IBOutlet var btnModCont: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnUptContra(_ sender: Any) {
        
        let rent:Double = Double(txtRenta.text!)!
      //  _ = DBManager.shared.updateRenta(idContrato: idContra!, renta: rent)
         _ = navigationController?.popViewController(animated: true)
        
        
    
        
    }
    
    @IBAction func btnEliminarContrato(_ sender: Any) {
        
       // _ = DBManager.shared.deleteContrato(idContra: idContra!)
      //  _ = DBManager.shared.updateAptt(idApt: (ContraUp?[0].getAptId)!, bandera: false)
        historial(listaContratos: contra!)
        ref?.child(new).removeValue()
        
        _ = navigationController?.popToRootViewController(animated: true)
        // _ = navigationController?.popToRootViewController(animated: true)
        
        
    }
    @IBOutlet var txtFechaIni: UITextField!
    
    @IBOutlet var txtRenta: UITextField!
    @IBOutlet var txtlugar: UITextField!

    @IBOutlet var txtFechaFin: UITextField!
    @IBOutlet var txtNombre: UITextField!
    
    
    
    func historial(listaContratos: listaContratos){
        
        let info = [
            "contraId": listaContratos.getID,
            "arrenId" : listaContratos.getArrId,
            "aptId" : listaContratos.getAptId,
            "fechaIn" : listaContratos.getFechaini,
            "fechaFin" : listaContratos.getFechafin,
            "monto" : listaContratos.getRenta,
            "ciudad": listaContratos.getCiudad,
            "nombre": listaContratos.getNombre,
            "apPat": listaContratos.getApPat,
            "apMat": listaContratos.getApMat,
            "calle": listaContratos.getCalle,
            "numero": listaContratos.getNum
                   
                   
               
               ] as [String: Any]
        
        self.ref?.child("historial").childByAutoId().setValue(info)
        var path = "aptID1/" + listaContratos.getAptId + "/ocupado";
               self.ref?.child(path).setValue(false)
        
    }
    
    func cargar(){
        btnModCont.setIcon(prefixText: "Modificar ", prefixTextColor: .white, icon: .linearIcons(.checkmarkCircle),iconColor: .orange, postfixText: "",  forState: .normal, iconSize: 25)
        btnModCont.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnModCont.layer.cornerRadius = 10
        btnModCont.clipsToBounds = true
        btnModCont.layer.borderWidth = 2
        btnModCont.layer.borderColor = UIColor.white.cgColor
        
        
        btnDelCont.setIcon(prefixText: "Eliminar ", prefixTextColor: .white, icon: .linearIcons(.crossCircle),iconColor: .orange, postfixText: "",  forState: .normal, iconSize: 16)
        btnDelCont.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnDelCont.layer.cornerRadius = 10
        btnDelCont.clipsToBounds = true
       btnDelCont.layer.borderWidth = 2
        btnDelCont.layer.borderColor = UIColor.white.cgColor
        txtlugar.backgroundColor = UIColor.white
        txtRenta.backgroundColor = UIColor.white
        txtNombre.backgroundColor = UIColor.white
        txtFechaIni.backgroundColor = UIColor.white
        txtFechaFin.backgroundColor = UIColor.white
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

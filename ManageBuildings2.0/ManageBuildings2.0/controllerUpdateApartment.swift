//
//  controllerUpdateApartment.swift
//  manageBuildings
//
//  Created by wrichy on 9/7/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import UIKit
import FirebaseDatabase


class controllerUpdateApartment: UIViewController,UITextFieldDelegate {

    var idValue:String?
    var apartUp:[Apartments]?
    var new = ""
    var ref:DatabaseReference?
    var bandera:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        cargar()
         new = "aptID1/"+(idValue ?? "")
       // print(new)
        ref = Database.database().reference();
        ref?.child(new).observeSingleEvent(of: .value, with: { (snapshot) in
           
            let data1 = snapshot.value as? NSDictionary
            // print(data1?["calle"] as? String ?? "")
            self.updateCalle.text = data1?["calle"] as? String ?? ""
            self.updateCiudad.text = data1?["ciudad"] as? String ?? ""
            self.updateEstado.text = data1?["estado"] as? String ?? ""
            self.updateNumero.text = data1?["numero"] as? String ?? ""
            self.updateCodigoPostal.text = String(data1?["codigo"] as! Int )
            
            self.bandera = data1?["ocupado"] as? Bool
        })
        //print("El valor es \(idValue)")
        //apartUp = DBManager.shared.getApartment(idAPt: idValue!)
     //   apartUp = DBManager.shared.getApartment(idAPt: idValue!)
        // Do any additional setup after loading the view.
        
       // let CodigoPos:String = String(apartUp![0].getCodigo)
        
       // updateCalle.text = apartUp?[0].getCalle
        //updateNumero.text = apartUp?[0].getNumero
       // updateCiudad.text = apartUp?[0].getCiudad
       // updateEstado.text = apartUp?[0].getEstado
      //  updateCodigoPostal.text = CodigoPos
        //cargar()
        
        
    }

    
    @IBAction func delApt(_ sender: Any) {
     //   _ = DBManager.shared.delApt(delApt: idValue!)
        ref?.child(new).removeValue()
        
        _ = navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func updateApt(_ sender: Any) {
        print("update")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var updateCodigoPostal: UITextField!
    
  
    @IBOutlet var updateEstado: UITextField!
    @IBOutlet var updateCiudad: UITextField!
    @IBOutlet var updateCalle: UITextField!

    @IBOutlet var updateNumero: UITextField!
 
    
    @IBOutlet var btnDelApt: UIButton!
    
   
    
    @IBOutlet var button2: UIButton!
    
   
    @IBAction func button2(_ sender: Any) {
        if validarTexto(textoCheck: self.updateCalle.text!), validarTexto(textoCheck: self.updateNumero.text!),validarTexto(textoCheck: self.updateCiudad.text!), validarTexto(textoCheck: self.updateEstado.text!){
                       
                       
                       if(validarNum(codigo: self.updateCodigoPostal.text!)){
                           let codig = Int(self.updateCodigoPostal.text!)
                        let apt:Apartments = Apartments(id: idValue!, calle: updateCalle.text!, numero: updateNumero.text!, ciudad: updateCiudad.text!, estado: updateEstado.text!, codigo: Int(updateCodigoPostal.text!) ?? 0, ocupado: self.bandera ?? false)
                               //DBManager.shared.updateApt(updateApt: apt)
                               actulizar(apartment: apt)
                        _ = navigationController?.popToRootViewController(animated: true)
                       }
                       else{
                        let alerta = UIAlertController(title: "Verifica datos", message: "Solo numeros en el campo codigo postal", preferredStyle: UIAlertController.Style.alert)
                        alerta.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: nil))
                           self.present(alerta, animated: true, completion: nil)
                           
                           
                       }
                       
                   }
                   else{
                let alerta = UIAlertController(title: "Verifica datos", message: "No puede haber campos vacios en el formulario", preferredStyle: UIAlertController.Style.alert)
                alerta.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: nil))
                       self.present(alerta, animated: true, completion: nil)
                   }

                   
        }
        
        func actulizar(apartment: Apartments){
            let info = [
                               "calle" : apartment.getCalle,
                               "numero" : apartment.getNumero,
                               "ciudad" : apartment.getCiudad,
                               "estado" : apartment.getEstado,
                               "codigo" :apartment.getCodigo,
                               "ocupado" : apartment.getOcupado
                               ] as [String : Any]
                          // self.ref?.child("aptID1").childByAutoId().setValue(info)//
            self.ref?.child(new).setValue(info)
    }
    
    func cargar(){
        
        button2.setIcon(prefixText: "Modificar ", prefixTextColor: .white, icon: .linearIcons(.checkmarkCircle),iconColor: .orange, postfixText: "",  forState: .normal, iconSize: 25)
       button2.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
       button2.layer.cornerRadius = 10
       button2.clipsToBounds = true
       button2.layer.borderWidth = 2
    button2.layer.borderColor = UIColor.white.cgColor
        
        
        btnDelApt.setIcon(prefixText: "Eliminar ", prefixTextColor: .white, icon: .linearIcons(.crossCircle),iconColor: .orange, postfixText: "",  forState: .normal, iconSize: 20)
        btnDelApt.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnDelApt.layer.cornerRadius = 10
        btnDelApt.clipsToBounds = true
        btnDelApt.layer.borderWidth = 2
        btnDelApt.layer.borderColor = UIColor.white.cgColor
    
        updateCalle.backgroundColor = UIColor.white
        updateEstado.backgroundColor = UIColor.white
        updateCiudad.backgroundColor = UIColor.white
        updateNumero.backgroundColor = UIColor.white
        updateCodigoPostal.backgroundColor = UIColor.white
        
        
 
 
 }
    func validarTexto(textoCheck: String)->Bool{
        
        let newTexto = textoCheck.trimmingCharacters(in: .whitespaces)
        if !newTexto.isEmpty, newTexto.count > 1{
            
            return true
        }
        return false
    }
    func validarNum(codigo: String)->Bool{
        
        let number = Int(codigo)
        return number != nil
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

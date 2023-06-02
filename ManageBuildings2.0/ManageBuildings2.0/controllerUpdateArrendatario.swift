//
//  controllerUpdateArrendatario.swift
//  manageBuildings
//
//  Created by wrichy on 9/5/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class controllerUpdateArrendatario: UIViewController {

    
    var idValue:String?
    var arrendatario: [Arrendatarios]?
    var new = ""
    var ref:DatabaseReference?
    
   //var datos: [Arrendatarios]?
    override func viewDidLoad() {
        super.viewDidLoad()
      //  let datos: [Arrendatarios] = DBManager.shared.getArrendatario(idPersona: idValue!)
        
        
       // self.updateNombre.text = datos[0].getNom
      //  self.updateApPat.text = datos[0].getApPat
       // self.updateAptMat.text = datos[0].getApMat
      //  self.updateCorreo.text = datos[0].getCorreo
      //  self.updateTel.text = datos[0].getTel
        cargar()
        
        new = "clientes/"+(idValue ?? "")
        ref = Database.database().reference();
        ref?.child(new).observeSingleEvent(of: .value, with: { (snapshot) in
            let data1 = snapshot.value as? NSDictionary
            
            self.updateNombre.text = data1?["nombre"] as? String ?? ""
            self.updateApPat.text = data1?["apPat"] as? String ?? ""
            self.updateAptMat.text = data1?["apMat"] as? String ?? ""
            self.updateCorreo.text = data1?["correo"] as? String ?? ""
            self.updateTel.text = data1?["tel"] as? String ?? ""
        })

        
         }
    
    /*override func viewDidAppear(_ animated: Bool) {
        let datos: [Arrendatarios] = DBManager.shared.getArrendatario(idPersona: idValue!)
        
        
        self.txtUpdateNombre.text = datos[0].getNom
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // We will simply print out the value here
       // print("The value of myStringValue is: \(idValue!)")
    }
   
    
    
    @IBOutlet var btnModArr: UIButton!
   
    @IBOutlet var btnDelArr: UIButton!
    @IBOutlet var updateNombre: UITextField!
    @IBOutlet var updateApPat: UITextField!
    @IBOutlet var updateAptMat: UITextField!
    @IBOutlet var updateCorreo: UITextField!
    @IBOutlet var updateTel: UITextField!
    @IBAction func btnUpdateArren(_ sender: Any) {
        if validarTexto(textoCheck: self.updateNombre.text!), validarTexto(textoCheck: self.updateApPat.text!),validarTexto(textoCheck: self.updateAptMat.text!){
            
            
            if(validarNum(codigo: self.updateTel.text!)){
                //let codig = Int(self.txt.text!)
                if verEmail(checkemail: self.updateCorreo.text!){
                    let updateArren = Arrendatarios(id: idValue!,nombre: self.updateNombre.text!, apPat:self.updateApPat.text!, apMat: self.updateAptMat.text!, correo: self.updateCorreo.text!, tel: self.updateTel.text!)
                //   _ = DBManager.shared.updateArrend(updateArr: updateArren)
                        actulizar(arren: updateArren)
                    _ = navigationController?.popViewController(animated: true)
                }
                else{
                    let alerta = UIAlertController(title: "Verifica correo", message: "Ingresa un correo valido", preferredStyle: UIAlertController.Style.alert)
                    alerta.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: nil))
                    self.present(alerta, animated: true, completion: nil)
                }
            }
            else{
                let alerta = UIAlertController(title: "Verifica datos", message: "Solo numeros en el campo telefono", preferredStyle: UIAlertController.Style.alert)
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
    

    @IBAction func btnEliminarArr(_ sender: Any) {
      //  _ = DBManager.shared.deleteArren(idDel: idValue!)
         ref?.child(new).removeValue()
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    func actulizar(arren: Arrendatarios){
            let info = [
                "nombre" : arren.getNom,
                "apPat" : arren.getApPat,
                "apMat" : arren.getApMat,
                "correo" : arren.getCorreo,
                "tel" :arren.getTel
                               ] as [String : Any]
                          // self.ref?.child("aptID1").childByAutoId().setValue(info)//
            self.ref?.child(new).setValue(info)
    }
    func cargar(){
        btnModArr.setIcon(prefixText: "Modificar ", prefixTextColor: .white, icon: .linearIcons(.checkmarkCircle),iconColor: .orange, postfixText: "",  forState: .normal, iconSize: 25)
        btnModArr.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnModArr.layer.cornerRadius = 10
        btnModArr.clipsToBounds = true
        btnModArr.layer.borderWidth = 2
        btnModArr.layer.borderColor = UIColor.white.cgColor
        
        
        btnDelArr.setIcon(prefixText: "Eliminar ", prefixTextColor: .white, icon: .linearIcons(.crossCircle),iconColor: .orange, postfixText: "",  forState: .normal, iconSize: 20)
        btnDelArr.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnDelArr.layer.cornerRadius = 10
        btnDelArr.clipsToBounds = true
        btnDelArr.layer.borderWidth = 2
        btnDelArr.layer.borderColor = UIColor.white.cgColor
        updateTel.backgroundColor = UIColor.white
        updateNombre.backgroundColor = UIColor.white
        updateCorreo.backgroundColor = UIColor.white
        updateApPat.backgroundColor = UIColor.white
        updateAptMat.backgroundColor = UIColor.white
    }
    
    func verEmail(checkemail: String)->Bool{
        let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let verifEmail = NSPredicate(format:"SELF MATCHES %@", email)
        return verifEmail.evaluate(with:checkemail)
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

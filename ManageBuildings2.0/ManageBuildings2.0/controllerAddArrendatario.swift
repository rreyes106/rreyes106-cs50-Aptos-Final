//
//  controllerAddArrendatario.swift
//  manageBuildings
//
//  Created by wrichy on 9/5/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import UIKit
import FirebaseDatabase
class controllerAddArrendatario: UIViewController {
    var ref:DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
        cargar()
        
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var btnRegisArr: UIButton!
    
    @IBOutlet var txtNombre: UITextField!
    @IBOutlet var txtApPat: UITextField!
    @IBOutlet var txtApMat: UITextField!
    @IBOutlet var txtCorreo: UITextField!
    @IBOutlet var txtTel: UITextField!

    @IBAction func btnRegistrarArr(_ sender: Any) {
        if validarTexto(textoCheck: self.txtNombre.text!), validarTexto(textoCheck: self.txtApPat.text!),validarTexto(textoCheck: self.txtApMat.text!){
            
            
            if(validarNum(codigo: self.txtTel.text!)){
                //let codig = Int(self.txt.text!)
                 if verEmail(checkemail: self.txtCorreo.text!){
               // _ = DBManager.shared.addArrendatario(inputNombre: self.txtNombre.text!, inputApPat: self.txtApPat.text!, inputApMat: self.txtApMat.text!, inputCorreo: self.txtCorreo.text!, inputTel:self.txtTel.text! )
                    
                    let nuevo = Arrendatarios(id: "", nombre: self.txtNombre.text!, apPat: self.txtApPat.text!, apMat: self.txtApMat.text!, correo: self.txtCorreo.text!, tel: self.txtTel.text!)
                
                    let info = [
                        "nombre": nuevo.getNom,
                        "apPat" : nuevo.getApPat,
                        "apMat": nuevo.getApMat,
                        "correo": nuevo.getCorreo,
                        "tel": nuevo.getTel
                    ] as [String: Any]
                    self.ref?.child("clientes").childByAutoId().setValue(info)
                _ = navigationController?.popToRootViewController(animated: true)
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
        
        
        
      /* let ids = DBManager.shared.addArrendatario(inputNombre: self.txtNombre.text!, inputApPat: self.txtApPat.text!, inputApMat: self.txtApMat.text!, inputCorreo: self.txtCorreo.text!, inputTel:self.txtTel.text! )
        
          txtNombre.text=""
          txtApPat.text=""
          txtApMat.text=""
          txtCorreo.text=""
          txtTel.text=""
        _ = navigationController?.popToRootViewController(animated: true)*/
        //print("\(ids)")
        
    }
    
    func cargar(){
        btnRegisArr.setIcon(prefixText: "Registrar ", prefixTextColor: .white, icon: .linearIcons(.checkmarkCircle),iconColor: .orange, postfixText: "",  forState: .normal, iconSize: 20)
        btnRegisArr.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnRegisArr.layer.cornerRadius = 10
        btnRegisArr.clipsToBounds = true
        btnRegisArr.layer.borderWidth = 2
        btnRegisArr.layer.borderColor = UIColor.white.cgColor
        txtNombre.backgroundColor = UIColor.white
        txtApPat.backgroundColor = UIColor.white
        txtApMat.backgroundColor = UIColor.white
        txtTel.backgroundColor = UIColor.white
        txtCorreo.backgroundColor = UIColor.white
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

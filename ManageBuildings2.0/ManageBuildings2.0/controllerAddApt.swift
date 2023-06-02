//
//  controllerAddApt.swift
//  manageBuildings
//
//  Created by wrichy on 9/7/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import UIKit
import FirebaseDatabase
class controllerAddApt: UIViewController {

    var ref:DatabaseReference?
    var dataBaseHandle:DatabaseHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        cargar()
        ref = Database.database().reference();

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var txtCodigoPos: UITextField!
    @IBOutlet var txtEstado: UITextField!
    @IBOutlet var txtCiudad: UITextField!
    @IBOutlet var txtCalle: UITextField!

    @IBOutlet var txtNumero: UITextField!
    
    @IBOutlet var btnRegistrarApt: UIButton!
   
    @IBAction func btnAgregarApatmts(_ sender: Any) {
        //print("Presionado")
        
        
        if validarTexto(textoCheck: self.txtCalle.text!), validarTexto(textoCheck: self.txtNumero.text!),validarTexto(textoCheck: self.txtCiudad.text!), validarTexto(textoCheck: self.txtEstado.text!){
            
            
            if(validarNum(codigo: self.txtCodigoPos.text!)){
                let codig = Int(self.txtCodigoPos.text!)
                let nuevoApt = Apartments(id: "", calle: self.txtCalle.text!, numero: self.txtNumero.text!, ciudad: self.txtCiudad.text!, estado: self.txtEstado.text!, codigo: codig!, ocupado: false)
                
              //  _ = DBManager.shared.addApartment(addApt: nuevoApt)
                let info = [
                    "calle" : nuevoApt.getCalle,
                    "numero" : nuevoApt.getNumero,
                    "ciudad" : nuevoApt.getCiudad,
                    "estado" : nuevoApt.getEstado,
                    "codigo" :nuevoApt.getCodigo,
                    "ocupado" : nuevoApt.getOcupado
                    ] as [String : Any]
                self.ref?.child("aptID1").childByAutoId().setValue(info)
                 _ = navigationController?.popViewController(animated: true)
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
    
    func cargar(){
        btnRegistrarApt.setIcon(prefixText: "Registrar ", prefixTextColor: .white, icon: .linearIcons(.checkmarkCircle),iconColor: .orange, postfixText: "",  forState: .normal, iconSize: 25)
        btnRegistrarApt.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnRegistrarApt.layer.cornerRadius = 10
        btnRegistrarApt.clipsToBounds = true
        btnRegistrarApt.layer.borderWidth = 2
        btnRegistrarApt.layer.borderColor = UIColor.white.cgColor
        txtCalle.backgroundColor = UIColor.white
        txtEstado.backgroundColor = UIColor.white
        txtCiudad.backgroundColor = UIColor.white
        txtNumero.backgroundColor = UIColor.white
        txtCodigoPos.backgroundColor = UIColor.white
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

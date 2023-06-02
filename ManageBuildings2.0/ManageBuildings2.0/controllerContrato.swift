//
//  controllerContrato.swift
//  manageBuildings
//
//  Created by wrichy on 9/11/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class controllerContrato: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {

    
    //let apartments:[Apartments] = DBManager.shared.queryAllAptsVacios()
   // let arrendatarios:[Arrendatarios] = DBManager.shared.queryAllArrendatarios()
    
    var apartment: [Apartments]? = []
    var arrendatario: [Arrendatarios]? = []
    var rowApt:Int = 0
    var rowArr:Int = 0
    var ref:DatabaseReference?
    var dataBaseHandle:DatabaseHandle?
    
    var auxApt:Int = 0
    
    //let colors = ["Red","Yellow","Green","Blue"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.pickerView2.dataSource = self
        self.pickerView2.delegate = self
       // pickerView.layer.backgroundColor = UIColor.black.cgColor
    
       // pickerView2.layer.backgroundColor = UIColor.black.cgColor
        datePicker.datePickerMode = .date
        datePicker.layer.backgroundColor = UIColor.white.cgColor
        let today = Date()
        datePicker.minimumDate = today
       // if apartments.count == 0 {
            
         //   checar()
            
       // }
        cargar()
        
        ref = Database.database().reference();
          dataBaseHandle = ref?.child("aptID1").observe(.childAdded, with: { (snapshot) in
         
          
          let data1 = snapshot.value as? NSDictionary
            //print(snapshot.value)
          
          
         
        //  print(nuevo.getId)
         //   self.auxApt += 1
            
            if (data1?["ocupado"] as? Bool == false){
                
                let nuevo = Apartments(id: snapshot.key,calle: data1?["calle"] as? String ?? "", numero: data1?["numero"] as? String ?? "",ciudad: data1?["ciudad"] as? String ?? "",estado: data1?["estado"] as? String ?? "",codigo: data1?["codigo"] as? Int ?? 0,
                ocupado: false)
                self.apartment?.append(nuevo)
                
            }
            self.pickerView.reloadAllComponents()
          
         
          //self.tableView.reloadData()
          
              
          })
        dataBaseHandle = ref?.child("clientes").observe(.childAdded, with: { (snapshot) in
                   let data1 = snapshot.value as? NSDictionary
                   //print(snapshot.value)
                   let nuevo = Arrendatarios(id: snapshot.key, nombre: data1?["nombre"] as? String ?? "",apPat: data1?["apPat"] as? String ?? "",apMat: data1?["apMat"] as? String ?? "",correo: data1?["correo"] as? String ?? "", tel: data1?["tel"] as? String ?? "")
                   
                   self.arrendatario?.append(nuevo)
                  // self.tableView.reloadData()
            self.pickerView2.reloadAllComponents()
                   
               })
        
        //rowApt = pickerView.selectedRow(inComponent: 0)
      //  rowArr = pickerView2.selectedRow(inComponent: 0)

       
    }
    
    
    @IBOutlet var pickerView2: UIPickerView!
   
    
    @IBOutlet var pickerView: UIPickerView!
    

    @IBOutlet var btnAgreCont: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var txtMonto: UITextField!
    
    @IBOutlet var txtMeses: UITextField!
    
 
  
    @IBAction func getDate(_ sender: Any) {
        
        
    }
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       if(pickerView.tag == 1){
       // print(apartment!.count)
       // print(auxApt)
        //return auxApt
        
        return apartment!.count
        }
        else if(pickerView == pickerView2){
        return arrendatario!.count
        }
        
        return 1
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag == 1){
            return apartment?[row].description
           // return colors[row]
        }
        else if(pickerView == pickerView2){
           return arrendatario?[row].description
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == 1){
        //rowApt = Int(apartments[row].getId)
            rowApt = row
        //print("\(fila)")
        }
        else{
            rowArr = row
            //let fila = arrendatarios[row].idArr
           // rowArr = Int(arrendatarios[row].idArr)
            //print("\(fila)")

        }
        
        
    }
    
    @IBAction func btnAgregarContrato(_ sender: Any) {
        
        if validarNum(codigo: txtMeses.text!),validarPre(codigo: txtMonto.text!){
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            let meses = Int(txtMeses.text!)
            var dateComponent = DateComponents()
            dateComponent.month = meses
            let fechaFin = Calendar.current.date(byAdding: dateComponent, to: datePicker.date)
            let montoFin = Double(txtMonto.text!)
        
            //rowApt = Int(apartments[rowApt].getId)
          //  rowArr = Int(arrendatarios[rowArr].idArr)
        
            let contrato = contratos(id: 1, arre_id: arrendatario![rowArr].idArr, apt_id: apartment![rowApt].getId, fechaIni: datePicker.date, fechaFin: fechaFin!, monto: montoFin!, estadoCon: true, nombre: arrendatario![rowArr].getNom, apPat: arrendatario![rowArr].getApPat, apMat: arrendatario![rowArr].getApMat, numero: apartment![rowApt].getNumero, calle: apartment![rowApt].getCalle, ciudad: apartment![rowApt].getCiudad)
        
            
            agregar(contrato: contrato)
         //   _ = DBManager.shared.updateAptt(idApt: Int64(rowApt), bandera: true)
        
          //  let idNCon = DBManager.shared.addNewContrato(addContrato: contrato)
        
           // _ = DBManager.shared.primerCobro(contratos_id:idNCon!,diaPag: datePicker.date, diaVenc: datePicker.date, monto: montoFin!, pago: false)
            _ = navigationController?.popViewController(animated: true)
        
        }
        else{
            let alerta = UIAlertController(title: "Verifica datos", message: "No pueden existir campos vacios (solo numeros en los campos)", preferredStyle: UIAlertController.Style.alert)
            alerta.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: nil))
            self.present(alerta, animated: true, completion: nil)
            
        }
        
        
        
       
     
        
    }
    
    func agregar(contrato: contratos){
     let formatter = DateFormatter()
     var dateComponent = DateComponents()
        
        dateComponent.month = 1
        dateComponent.day = 0
        dateComponent.year = 0
      formatter.dateFormat = "yyyy-MM-dd"
        
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: contrato.fechaIni)
        let info = [
            "arrenId" : contrato.get_arre_id,
            "aptId" : contrato.get_apt_id,
            "fechaIn" : formatter.string(from: contrato.getfechaIni),
            "fechaFin" : formatter.string(from: contrato.getfechaFin),
            "monto" : contrato.getmonto,
            "estado" : contrato.getEstado,
            "nombre": contrato.getNombre,
            "apPat": contrato.getapPat,
            "apMat": contrato.getapMat,
            "calle": contrato.getCalle,
            "numero": contrato.getNumero,
            "ciudad": contrato.getCiudad,
            "rentafecha": formatter.string(from: futureDate!)
        
        ] as [String: Any]
        
        
        
        
        
        self.ref?.child("contrato").childByAutoId().setValue(info)
        var path = "aptID1/" + contrato.get_apt_id + "/ocupado"
        self.ref?.child(path).setValue(true)
    }
    
   
    func cargar(){
        btnAgreCont.setIcon(prefixText: "Registrar ", prefixTextColor: .white, icon: .linearIcons(.checkmarkCircle),iconColor: .orange, postfixText: "",  forState: .normal, iconSize: 18)
        btnAgreCont.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnAgreCont.layer.cornerRadius = 10
       btnAgreCont.clipsToBounds = true
        btnAgreCont.layer.borderWidth = 2
        btnAgreCont.layer.borderColor = UIColor.white.cgColor
        txtMonto.backgroundColor = UIColor.white
        txtMeses.backgroundColor = UIColor.white
    }
    
    func validarNum(codigo: String)->Bool{
        
        let number = Int(codigo)
        return number != nil
    }
    func validarPre(codigo: String)->Bool{
        
        let number = Double(codigo)
        return number != nil
    }
    func checar(){
        let alerta = UIAlertController(title: "No hay vacantes", message: "No tienes apartamentos disponibles", preferredStyle: UIAlertController.Style.alert)
        let aceptarAction = UIAlertAction(title: "OK", style: .default) { (alert: UIAlertAction!) -> Void in
            _ = self.navigationController?.popViewController(animated: true)
        }
        alerta.addAction(aceptarAction)
        self.present(alerta, animated: true, completion: nil)
    
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

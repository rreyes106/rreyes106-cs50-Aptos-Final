//
//  manageRentas.swift
//  manageBuildings
//
//  Created by wrichy on 9/13/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import UIKit
import FirebaseDatabase
class manageRentas: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //var rentas[rentas] = DBManager.shared.getAllRentas()
  //  var renta: [rentas] = DBManager.shared.getAllRentas()
    
    var contratosLista : [listaContratos]? = []
       var ref:DatabaseReference?
       var dataBaseHandler:DatabaseHandle?
    var rentas : [pagosRenta]? = []
    var indice: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
               dataBaseHandler = ref?.child("contrato").observe(.childAdded, with: { (snapshot) in
                   let data1 = snapshot.value as? NSDictionary
               
                let nuevoRenta = pagosRenta(contratoid: snapshot.key, arre_id: data1?["arrenId"] as? String ?? "", apt_id: data1?["aptId"] as? String ?? "", monto: data1?["monto"] as? Double ?? 0.0, nombre: data1?["nombre"] as? String ?? "", apPat: data1?["apPat"] as? String ?? "", numero: data1?["numero"] as? String ?? "", calle: data1?["calle"] as? String ?? "", ciudad: data1?["ciudad"] as? String ?? "", fechaRenta: data1?["rentafecha"] as? String ?? "", fechaPago: data1?["fecharenta"] as? String ?? "")
                   
                /*   let nuevo = listaContratos(apt_id: data1?["aptId"] as? String ?? "", arr_id: data1?["arrenId"] as? String ?? "", id_cont:  snapshot.key, fechaIni: data1?["fechaIn"] as? String ?? "", fechaFin: data1?["fechaFin"] as? String ?? "", renta: data1?["monto"] as? Double ?? 0.0,nombre: data1?["nombre"] as? String ?? "",apPat: data1?["apPat"] as? String ?? "", apMat: data1?["apMat"] as? String ?? "", calle: data1?["calle"] as? String ?? "", numero: data1?["numero"] as? String ?? "", ciudad: data1?["ciudad"] as? String ?? "")
                   
                   self.contratosLista?.append(nuevo)*/
                self.rentas?.append(nuevoRenta);
                self.tableRenta.reloadData()
                   })
        cargar()
        
      //  DBManager.shared.crearRentas()
      //  DBManager.shared.selecRentas()
        //print("aqui")

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var tableRenta: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return apartments.count
        //return renta.count
        return rentas!.count
    }
    @IBOutlet var btnPagado: UIButton!
    
    @IBAction func btnPagar(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lblRentas", for: indexPath)
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.text = rentas?[indexPath.row].getvals
        //   let selectedCell = tableView.cellForRow(at: indexPath)!
        
        
        return cell
    }
    
    @IBAction func pagarAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Pago", message: "Se realizo el pago? **\(rentas![indice!].getvals) **", preferredStyle: .alert)
        let aceptarAction = UIAlertAction(title: "SI", style: .default) { (alert: UIAlertAction!) -> Void in
            print("Pago realizado \(self.rentas![self.indice!].getmonto)")
           // DBManager.shared.updateRentas(idRent: self.renta[indice].getrentaId)
            _ = self.navigationController?.popViewController(animated: true)
        }
        let cancelarAction = UIAlertAction(title: "Cancel", style: .default) { (alert: UIAlertAction!) -> Void in
            print("Cancelaste pago")
        }
        
        alert.addAction(aceptarAction)
        alert.addAction(cancelarAction)
        
        present(alert, animated: true, completion:nil)
    }
    
    func pagar(){
        
        print("pagar")
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let cell = tableView.cellForRow(at: arrendatario[indexPath.row].description)
//FechaRenta: data1?["fecharenta"] as? String ?? ""
        indice = indexPath.row
        
        //ctra = contratosLista?[indice].getID ?? ""
        //ctra = pagosRenta?[indice].getID ?? ""
        
      //  performSegue(withIdentifier: "updateContrato", sender: self)
        
       // arr = arrendatario[indice].id!
       //
        
        
        
       
        
       // alert.addAction(aceptarAction)
      //  alert.addAction(cancelarAction)
        
     //   present(alert, animated: true, completion:nil)
      //
    }
    
   
    func cargar(){
           btnPagado.setIcon(prefixText: "Pagar ", prefixTextColor: .white, icon: .fontAwesomeRegular(.moneyBillAlt), iconColor: .green,postfixText: "",  forState: .normal, iconSize: 25)
        btnPagado.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnPagado.layer.cornerRadius = 20
        btnPagado.clipsToBounds = true
        btnPagado.layer.borderWidth = 2
               btnPagado.layer.borderColor = UIColor.white.cgColor
        
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

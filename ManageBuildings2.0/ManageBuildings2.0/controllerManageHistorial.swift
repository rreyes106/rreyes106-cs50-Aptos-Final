//
//  controllerManageHistorial.swift
//  manageBuildings
//
//  Created by wrichy on 9/21/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import UIKit

class controllerManageHistorial: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var rentasFes:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker1.datePickerMode = .date
        datePicker2.datePickerMode = .date
        
        datePicker1.layer.backgroundColor = UIColor.black.cgColor
        datePicker2.layer.backgroundColor = UIColor.black.cgColor
        let today = Date()
        datePicker1.maximumDate = today;
        datePicker2.maximumDate = today;
       // let date = Date()
        
        cargar()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var tableRentas: UITableView!
    @IBOutlet var datePicker1: UIDatePicker!
    
    @IBOutlet var datePicker2: UIDatePicker!

    @IBOutlet var btnBuscar: UIButton!
    @IBAction func btnBuscar(_ sender: Any) {
        
        
   //     rentasFes = DBManager.shared.selecRentas(fechaUno: datePicker1.date, fechaDos: datePicker2.date)

        self.tableRentas.reloadData()
               
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return apartments.count
        //rentasFe = DBManager.shared.rentasFechas(fechaIni: datePicker1.date, fechaFin: datePicker1.date)
      //  rentasFes = DBManager.shared.selecRentas(fechaUno: datePicker1.date, fechaDos: datePicker2.date)
//        return (rentasFes?.count)!
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lblPago", for: indexPath)
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = .byWordWrapping
        
        cell.textLabel?.text = rentasFes?[indexPath.row]
        
        
             
        
        
        return cell
    }
    
    func cargar(){
        btnBuscar.setIcon(prefixText: "Buscar ", prefixTextColor: .white, icon: .linearIcons(.magnifier), iconColor: .white,postfixText: "",  forState: .normal, iconSize: 18)
        btnBuscar.layer.borderWidth = 2
        btnBuscar.layer.borderColor = UIColor.white.cgColor
        btnBuscar.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnBuscar.layer.cornerRadius = 10
        btnBuscar.clipsToBounds = true
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

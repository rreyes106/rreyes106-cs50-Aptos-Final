//
//  ViewController.swift
//  manageBuildings
//
//  Created by wrichy on 9/1/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import UIKit
import SwiftIcons
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        //DBManager.shared.queryAllApts()
        cargar()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var btnArrend: UIButton!
    
    
    @IBOutlet var btnApartamentos: UIButton!
    
    @IBOutlet var btnContrato: UIButton!
    
    @IBOutlet var btnRentas: UIButton!
    @IBOutlet var btnHistorial: UIButton!
    func cargar(){
        btnApartamentos.setIcon(prefixText: "Apartamentos ", prefixTextColor: .white, icon: .linearIcons(.apartment),iconColor: .orange, postfixText: "",  forState: .normal, iconSize: 25)
       btnArrend.setIcon(prefixText: "Arrendatarios ", prefixTextColor: .white, icon: .linearIcons(.users),iconColor: .orange, postfixText: "",  forState: .normal, iconSize: 25)
        btnContrato.setIcon(prefixText: "Contratos ", prefixTextColor: .white, icon: .linearIcons(.pencil),iconColor: .orange, postfixText: "",  forState: .normal, iconSize: 25)
       btnRentas.setIcon(prefixText: "Rentas ", prefixTextColor: .white, icon: .fontAwesomeRegular(.moneyBillAlt), iconColor: .green,postfixText: "",  forState: .normal, iconSize: 25)
        btnHistorial.setIcon(prefixText: "Historial ",prefixTextColor: .white, icon: .linearIcons(.history),iconColor: .orange, postfixText: "",  forState: .normal, iconSize: 25)
        btnHistorial.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        //btnHistorial.setTitleColor(UIColor.orange, for: .normal)
        btnHistorial.layer.cornerRadius = 20
        btnHistorial.clipsToBounds = true
        btnRentas.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnRentas.layer.cornerRadius = 20
        btnRentas.clipsToBounds = true
        btnContrato.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnContrato.layer.cornerRadius = 20
        btnContrato.clipsToBounds = true
        btnArrend.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnArrend.layer.cornerRadius = 20
        btnArrend.clipsToBounds = true
        btnApartamentos.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 0.8)
        btnApartamentos.layer.cornerRadius = 20
        btnApartamentos.clipsToBounds = true
        btnApartamentos.layer.borderWidth = 2
        btnApartamentos.layer.borderColor = UIColor.white.cgColor
        btnArrend.layer.borderWidth = 2
        btnArrend.layer.borderColor = UIColor.white.cgColor
        btnContrato.layer.borderWidth = 2
        btnContrato.layer.borderColor = UIColor.white.cgColor
        btnRentas.layer.borderWidth = 2
        btnRentas.layer.borderColor = UIColor.white.cgColor
        btnHistorial.layer.borderWidth = 2
        btnHistorial.layer.borderColor = UIColor.white.cgColor
        
        
        
        
        
    }
    //let button5 = UIButton(frame: CGRect(x: 20, y:-20, width:2-40, height: 2-40))
    
    
    
}


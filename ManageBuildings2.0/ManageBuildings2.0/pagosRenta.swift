//
//  pagosRenta.swift
//  ManageBuildings2.0
//
//  Created by Wrichy Reyes on 5/11/20.
//  Copyright © 2020 wrichy. All rights reserved.
//

import Foundation
class pagosRenta{

let contratoid:String
     let arre_id:String
     let apt_id:String
     let monto:Double
     let nombre:String
     let apPat:String
     let numero:String
     let calle:String
     let ciudad:String
  let fechaRenta:String
  let fechaPago:String
     
     
  init(contratoid: String, arre_id: String, apt_id:String, monto:Double, nombre: String, apPat: String,  numero: String, calle: String, ciudad: String, fechaRenta:String, fechaPago: String) {
         self.contratoid = contratoid
         self.arre_id = arre_id
         self.apt_id = apt_id
       //  self.fechaIni = fechaIni
        // self.fechaFin = fechaFin
         self.monto = monto
       //  self.estadoCon = estadoCon
         self.nombre = nombre
         self .apPat = apPat
       //  self .apMat = apMat
         self .calle = calle
         self .numero = numero
         self.ciudad = ciudad
      self.fechaRenta = fechaRenta
      self.fechaPago = fechaPago
     }
     
     var getCiudad: String{
         return ciudad;
     }
     var getNumero: String{
         return numero;
     }
     var getCalle: String{
         return calle;
     }
    
     var getNombre: String{
         return nombre;
     }
     
     var getapPat: String{
         return apPat;
     }
     
     
     var get_arre_id:String {
         return arre_id
     }
     
     var get_apt_id:String{
         return apt_id
     }
     
     
     var getmonto: Double{
         return monto
     }
    
    var getvals: String{
        
       return "\(nombre), \(calle) \(numero), $\(monto), fecha de pago: \(fechaRenta)"
    }
    
  /*var rentasPagadas: String{
      let dateFormatter = DateFormatter()
      dateFormatter.dateStyle = .short
      
      //let fecha = dateFormatter.string(from: fechaPago)
      
      return "\(nombre), \(calle) \(numero), $\(monto), fecha de pago: \()"
  
  }*/
}

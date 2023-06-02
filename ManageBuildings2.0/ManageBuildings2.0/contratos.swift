//
//  contratos.swift
//  manageBuildings
//
//  Created by wrichy on 9/11/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import Foundation
class contratos: CustomStringConvertible{
    let id:Int64
    let arre_id:String
    let apt_id:String
    let fechaIni:Date
    let fechaFin:Date
    let monto:Double
    let estadoCon:Bool
    let nombre:String
    let apPat:String
    let apMat:String
    let numero:String
    let calle:String
    let ciudad:String
    
    
    init(id: Int64, arre_id: String, apt_id:String, fechaIni: Date, fechaFin: Date, monto:Double, estadoCon: Bool, nombre: String, apPat: String, apMat:String, numero: String, calle: String, ciudad: String) {
        self.id = id
        self.arre_id = arre_id
        self.apt_id = apt_id
        self.fechaIni = fechaIni
        self.fechaFin = fechaFin
        self.monto = monto
        self.estadoCon = estadoCon
        self.nombre = nombre
        self .apPat = apPat
        self .apMat = apMat
        self .calle = calle
        self .numero = numero
        self.ciudad = ciudad
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
    var getapMat: String{
        return apMat;
    }
    var getNombre: String{
        return nombre;
    }
    
    var getapPat: String{
        return apPat;
    }
    var description: String{
        return "\(fechaIni)  \(nombre) \(apPat)"
    }
    
    var get_arre_id:String {
        return arre_id
    }
    
    var get_apt_id:String{
        return apt_id
    }
    
    var getfechaIni:Date{
        return fechaIni
    }
    var getfechaFin: Date{
        return fechaFin
    }
    var getmonto: Double{
        return monto
    }
    var getEstado: Bool{
        return estadoCon
    }

}

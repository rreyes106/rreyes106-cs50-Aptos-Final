//
//  listaContratos.swift
//  manageBuildings
//
//  Created by wrichy on 9/13/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import Foundation

class listaContratos: CustomStringConvertible{
    
    var apt_id: String = ""
   var arr_id: String = ""
    var id_cont:String = ""
   var fechaIni: String = ""
    var fechaFin:String = ""
    var renta: Double = 0.0
    var nombre:String = ""
    var apPat:String = ""
    var apMat: String = ""
    var calle: String=""
    var numero: String=""
    var ciudad: String = ""
    
    
   /* init(calle: String, numero: String, nombre: String, apPat: String, apMat: String, apt_id: String, arr_id: String, id_cont: String, fechaIni: String, fechaFin:String, renta: Double){
        self.calle = calle
        self.numero = numero
        self.nombre = nombre
        self.apPat = apPat
        //self.apMat = apMat
        self.apt_id = apt_id
        self.arr_id = arr_id
        self.id_cont = id_cont
        self.fechaIni = fechaIni
        self.fechaFin = fechaFin
        self.renta = renta
    
    }*/
    
   // init (nombre:String, calle:String){
      //  self.nombre = nombre
      //   self.calle = calle
        
   // }
    
    init( apt_id: String, arr_id: String, id_cont: String, fechaIni: String, fechaFin: String, renta: Double,nombre: String, apPat: String, apMat: String, calle:String, numero:String, ciudad:String){
       
        self.apt_id = apt_id
        self.arr_id = arr_id
        self.id_cont = id_cont
        self.fechaIni = fechaIni
        self.fechaFin = fechaFin
        self.renta = renta
        self.nombre = nombre
        self.apPat = apPat
        self.apMat = apMat
        self.calle = calle
        self.numero = numero
        self.ciudad = ciudad
    
    }
    /*
    init() {
        var stringsf = "good"
    }
    
    func setaptID (aptID: String){
        apt_id = aptID
    }
    func setarrID (arrID: String){
        arr_id = arrID
    }
    func  setContId(contID: String){
        id_cont = contID
    }
    func setFechaIni (feIni: String){
        fechaIni = feIni
    }
    func setFechaFin (feFin: String){
        fechaFin = feFin
    }
    func setRenta (rent: Double){
        renta = rent
    }
    func setNombre(nom: String){
        nombre = nom
    }
    func setapPat (pat: String){
        apPat = pat
    }
    func setCalle (street: String){
        calle = street
    }
    func setNume (num: String){
        numero = num
    }
    func setCiudad (city: String){
        ciudad = city
    }
    */
    var getApMat:String{
        
        return apMat;
    }
    var getApPat:String{
        
        return apPat;
    }
    var description: String{
       // return "\(calle) \(numero), \(nombre) \(apPat)"
       // return "\(nombre) \(calle)"
        
        return "\(nombre) \(apPat) - \(calle) \(numero), \(ciudad) - $\(renta)"
    }
    var getID: String{
        return id_cont;
    }
    
    var getId: String{
        return id_cont
    }
    
    var getNombre: String{
      //  return "\(nombre) \(apPat) \(apMat)"
        return nombre
    
    }
    var getDireccion: String{
       // return "\(calle) \(numero)"\re
        return ""
    }
    
    var getFechaini: String{
        return fechaIni
    }
    
    var getFechafin: String{
        return fechaFin
    }
    
    var getRenta: Double{
        return renta
    }
    
    var getAptId: String{
        return apt_id
    }
    var getArrId: String{
        return arr_id
    }
    
    var getCiudad: String{
        
        return ciudad;
    }
    var getCalle: String{
        return calle;
    }
    var getNum: String{
        return numero;
    }
}

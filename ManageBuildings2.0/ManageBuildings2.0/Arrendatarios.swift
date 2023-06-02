//
//  Arrendatarios.swift
//  manageBuildings
//
//  Created by wrichy on 9/5/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import Foundation

class Arrendatarios: CustomStringConvertible{
    let id: String
    var nombre: String
    var apPat: String
    var apMat: String
    var correo: String
    var tel: String
    
    init(id: String, nombre: String, apPat: String, apMat: String, correo: String, tel: String){
    
        self.id = id
        self.nombre = nombre
        self.apPat = apPat
        self.apMat = apMat
        self.correo = correo
        self.tel = tel
        
    }
    
    
    var description: String   {
        return  "\(self.nombre) \(self.apPat) \(self.apMat)"
    }
    
    var idArr: String{
        return id
    
    }
    
    var getNom: String{
        return nombre
    }
    
    var getApPat: String{
        return apPat
    }
    
    var getApMat: String{
        return apMat
    }
    
    var getCorreo: String{
        return correo
    }
    
    var getTel: String{
        return tel
    }

}

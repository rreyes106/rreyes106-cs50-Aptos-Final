//
//  Apartments.swift
//  manageBuildings
//
//  Created by wrichy on 9/1/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import Foundation

class Apartments: CustomStringConvertible{
    let id: String
    var numero: String
    var calle:String
    var estado:String
    var ciudad:String
    var codigo: Int
    var ocupado: Bool
    
    
    init(id: String, calle: String, numero: String, ciudad: String, estado:String, codigo: Int, ocupado: Bool) {
        self.id = id
        self.numero = numero
        self.calle = calle
        self.ciudad = ciudad
        self.estado = estado
        self.codigo = codigo
        self.ocupado = ocupado
        
        
    }
    
    
    var getId: String{
        return id
    }
    var getNumero:String{
        return numero
    
    }
    var getCalle:String{
        return calle
    }
    var getCiudad:String{
        return ciudad
    }
    var getEstado:String{
        return estado
    }
    var getCodigo:Int{
        return codigo
    }
    var getOcupado:Bool{
        return ocupado
    }
    
    var description: String{
        return "\(self.calle) \(self.numero), \(self.ciudad) \(self.estado)"
    }
}

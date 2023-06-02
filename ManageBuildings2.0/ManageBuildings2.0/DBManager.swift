//
//  DBManager.swift
//  manageBuildings
//
//  Created by wrichy on 9/1/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import Foundation
//import SQLite

class DBManager{
    
   /* static let shared: DBManager = DBManager()
    private let db: Connection?
    
    private let tblApartamentos = Table("apartamentos")
    private let id = Expression<Int64>("id")
    private let numero = Expression<String?>("numero")
    private let calle = Expression<String?>("calle")
    private let ciudad = Expression<String?>("ciudad")
    private let estado =
        Expression<String?>("estado")
    private let codPos = Expression<Int>("codigoPostal")
    private let ocupado = Expression<Bool>("ocupado")
    
    
    private let renta = Expression<Double>("renta")
    
    private let tblArrendatario = Table("arrendatarios")
    private let idArr = Expression<Int64>("id")
    private let nombre = Expression<String?>("nombre")
    private let apPat = Expression<String?>("apPat")
    private let apMat = Expression<String?>("apMat")
    private let correo = Expression<String?>("email")
    private let tel = Expression<String?>("tel")
    
    private let tblContrato = Table("contratos")
    private let idCon = Expression<Int64>("id")
    private let arre_id = Expression<Int64>("arren_id")
    private let apt_id = Expression<Int64>("apt_id")
    private let fechaIni = Expression<Date>("fechaIni")
    private let fechaFin = Expression<Date>("fechaFin")
    private let monto = Expression<Double>("monto")
    private let estadoCont = Expression<Bool>("estado")
    
    private let tblRenta = Table("rentas")
    private let idRenta = Expression<Int64>("id")
    private let contrato_id = Expression<Int64> ("contrato_id")
    private let diaPagado = Expression<Date>("fecha_pago")
    private let diaVencimiento = Expression<Date>("fecha_renta")
    private let montoPago = Expression<Double>("monto_pago")
    private var pagado = Expression<Bool>("pagado")
    
    
    
    
    private init(){
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true).first!
        do{
            db = try Connection("\(path)/apartment.sqlite3")
            //crearTablaUsuario()
            crearTablaApts()
            crearTablaArrendatario()
            createTableContrato()
            createTableRenta()
           //dropTable()
        }
        catch{
            db=nil
            print("no se puede conectar a la base de datos")
        }
    }
    
    
    
    
    func dropTable(){
        do{
            try db!.run(tblRenta.drop())
            print("se borro la tabla")
        }
        
        catch{
            print("No se pudo borrar la tabla")
        }
    }
    
    func crearTablaApts() {
        do {
            try db!.run(tblApartamentos.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(calle)
                table.column(numero)
                table.column(ciudad)
                table.column(estado)
                table.column(codPos)
                table.column(ocupado)
                
                
            })
            
            print("se creo la tabla apartamentos")
        } catch {
            print("no se puedo crear la tabla")
        }
    }
    
    func createTableRenta(){
        do{
            try db?.run(tblRenta.create(ifNotExists: true){ table in
            table.column(idRenta, primaryKey: true)
            table.column(contrato_id)
            table.column(diaPagado)
            table.column(diaVencimiento)
            table.column(montoPago)
            table.column(pagado, defaultValue: false)
                
           // table.check(diaVencimiento != diaVencimiento && contrato_id != contrato_id)
                //
                table.unique(contrato_id, diaVencimiento)
           
            })
            
           // crearIndex()
            print("se creo la tabla renta")
        } catch{
            print("No se pudo crear la tabla renta")
        }
    }
    
    func crearIndex(){
        do{
            
            try db?.run("CREATE INDEX index_norep on rentas (contrato_id, fecha_renta)")
            print("Se creo el indice")
        }
        catch{
            print("no se pudo crear el indice")
        }
    
    }
    func createTableContrato(){
    do{
        try db!.run(tblContrato.create(ifNotExists: true) { table in
            table.column(idCon, primaryKey: true)
            table.column(arre_id)
            table.column(apt_id)
            table.column(fechaIni)
            table.column(fechaFin)
            table.column(monto)
            table.column(estadoCont)
            
            table.foreignKey(arre_id, references: tblArrendatario, idArr, delete: .setNull)
            table.foreignKey(apt_id, references: tblApartamentos, id, delete: .setNull)
            print("Se creo la tabla contrato")
            
        })
    }
    catch {
        print("no se puedo crear la tabla")
        }
    }
    
    func crearTablaArrendatario(){
        do{
            try db!.run(tblArrendatario.create(ifNotExists: true) { table in
                table.column(idArr, primaryKey: true)
                table.column(nombre)
                table.column(apPat)
                table.column(apMat)
                table.column(correo)
                table.column(tel)
            })
            print("Se creo la tabla arrendatarios")
        }
        catch{
            print("no se puede crear la tabla arrendatario")
        }
    }
    
    
    
    func addApartment(addApt: Apartments) -> Int64? {
        do {
            let insert = tblApartamentos.insert(calle <- addApt.getCalle, numero <- addApt.getNumero, ciudad <- addApt.getCiudad, estado <- addApt.getEstado, codPos <- addApt.getCodigo, ocupado <- addApt.getOcupado)
            let id = try db!.run(insert)
            print("Se inserto a la tabla")
            return id
        } catch {
            print("No se puede insertar ")
            return nil
        }
    }
    
    func addNewContrato(addContrato: contratos)->Int64?{
        do{
            let insert = tblContrato.insert(arre_id <- addContrato.get_arre_id, apt_id <- addContrato.get_apt_id, fechaIni <- addContrato.getfechaIni , fechaFin <- addContrato.getfechaFin,monto <- addContrato.getmonto, estadoCont <- addContrato.getEstado)
            let id = try db?.run(insert)
            print("se inserto contrato")
            return id
        }
        catch{
            print("no se inserto en el contrato")
            return nil
        }
    }
    
    func primerCobro(contratos_id: Int64, diaPag: Date, diaVenc: Date, monto: Double, pago: Bool)->Int64?{
        do{
            let insert = tblRenta.insert(contrato_id <- contratos_id, diaPagado <- diaPag,  diaVencimiento <- diaVenc, montoPago <- monto, pagado <- pago)
            let id = try db?.run(insert)
            print("se inserto en la renta")
            return id
        }
        catch{
            print("no se pudo insertar en la renta")
            return nil
        }
    
    }
    
    func addArrendatario(inputNombre: String, inputApPat: String, inputApMat: String, inputCorreo: String , inputTel: String)-> Int64?{
        do{
            let insert = tblArrendatario.insert(nombre <- inputNombre,apPat <- inputApPat, apMat <- inputApMat, correo <- inputCorreo, tel <- inputTel)
            let id = try db!.run(insert)
            print("se inserto en la tabla")
            return id
        }
        catch{
            print("no se puede insertar")
            return nil
        }
        
        
    
    }
    
   func queryAllApts() -> [Apartments] {
        var apartments = [Apartments]()
        
        do {
            for apartment in try db!.prepare(self.tblApartamentos) {
                let newAPt = Apartments(id: apartment[id],
                calle: apartment[calle] ?? "",
                numero: apartment[numero]!,
                ciudad: apartment[ciudad]!,
                estado: apartment[estado]!,
                codigo: apartment[codPos],
                ocupado: apartment[ocupado]
                )
                
                apartments.append(newAPt)
            }
        } catch {
            print("No se puede obtener la lista")
        }
        for apt in apartments{
            print("apartamento = \(apt)")
        }
        return apartments
    }
    
    
    func getContratos()->[listaContratos]{
        var lista = [listaContratos]()
        let query = tblContrato.select(*).join(tblArrendatario, on: tblContrato[arre_id] == tblArrendatario[idArr])
            .join(tblApartamentos, on: tblContrato[apt_id] == tblApartamentos[id])
        
        do{
        let items = try db?.prepare(query)
        
        for item in items!{
            let nListaCon = listaContratos(calle: item[tblApartamentos[calle]]!, numero: item[tblApartamentos[numero]]!, nombre: item[tblArrendatario[nombre]]!, apPat: item[tblArrendatario[apPat]]!, apMat: item[tblArrendatario[apMat]]!, apt_id: item[tblContrato[apt_id]], arr_id: item[tblContrato[arre_id]], id_cont: item[tblContrato[idCon]],fechaIni: item[tblContrato[fechaIni]], fechaFin:item[tblContrato[fechaFin]],renta: item[tblContrato[monto]])
            lista.append(nListaCon)
        }
        }
        catch{
            print("NO se puede obtener la lista de contratos")
            }
        return lista
    }
    
    func getContrato(idContrato: Int64)->[listaContratos]{
        var lista = [listaContratos]()
        let query = tblContrato.select(*).join(tblArrendatario, on: tblContrato[arre_id] == tblArrendatario[idArr])
            .join(tblApartamentos, on: tblContrato[apt_id] == tblApartamentos[id])
            .where(tblContrato[idCon] == idContrato)
        do{
            let items = try db?.prepare(query)
            
            for item in items!{
                let nListaCon = listaContratos(calle: item[tblApartamentos[calle]]!, numero: item[tblApartamentos[numero]]!, nombre: item[tblArrendatario[nombre]]!, apPat: item[tblArrendatario[apPat]]!, apMat: item[tblArrendatario[apMat]]!, apt_id: item[tblContrato[apt_id]], arr_id: item[tblContrato[arre_id]], id_cont: item[tblContrato[idCon]],fechaIni: item[tblContrato[fechaIni]], fechaFin:item[tblContrato[fechaFin]],renta: item[tblContrato[monto]])
                lista.append(nListaCon)
            }
        }
        catch{
            print("NO se puede obtener la lista de contratos")
        }
        return lista    }
    
    func crearRentas(){
        do{
            
            
            //insert into rentas(contrato_id,fecha_pago, fecha_renta, monto_pago)
       _ = try db?.run("insert into rentas(contrato_id,fecha_pago, fecha_renta, monto_pago) select contrato_id, fecha_pago, strftime('%Y-%m-%dT%H:%M:%f',datetime(fecha_renta,'+1 month')), monto_pago from rentas inner join contratos on rentas.contrato_id = contratos.id where date(date(fecha_renta,'+1 month'), '-5 days') <= date() AND date(fechaFin,'-1 month') > date()" )
    
            //where date(now, '-5 days') <= fecha_renta or fecha_renta > date() and pagado = 0"
        
        } catch{
        
            print("No se pudo crear las rentas")
        }
    
    }
    
   
    
    func nuevaRenta(contratos_id: Int64, diaPag: Date, diaVenc: Date, monto: Double, pago: Bool)->Int64?{
    
        do{
            let insert = tblRenta.insert(contrato_id <- contratos_id, diaPagado <- diaPag,  diaVencimiento <- diaVenc, self.montoPago <- monto, pagado <- pago)
            let id = try db?.run(insert)
            print("se inserto nueva renta")
            return id!
        }
        catch{
            print("no se pudo insertar en la renta")
            return nil
        }
    
    }
    
    
   
    
    
    func getAllRentas()->[rentas]{
        
        var rentasAll = [rentas]()
        let getRenta = tblRenta.filter(pagado == false).join(tblContrato, on: tblRenta[contrato_id] == tblContrato[idCon]).join(tblArrendatario, on: tblContrato[arre_id] == tblArrendatario[idArr]).join(tblApartamentos, on: tblApartamentos[id] == tblContrato[apt_id])
        do{
            let rentass = try db?.prepare(getRenta)
            for renta in rentass!{
                
               
                
              //  print("\(renta[diaVencimiento]) \(renta[nombre]) \(renta[calle]) \(renta[numero]))")
                let rentaNew = rentas(idRenta: renta[tblRenta[idRenta]], contrato_id: renta[contrato_id], fecha_renta: renta[diaVencimiento],fecha_pago: renta[diaPagado], monto: renta[monto], nombre: renta[nombre]!, apPat: renta[apPat]!, calle: renta[calle]!, num: renta[numero]!)
                //let rentaNew - rentas
                rentasAll.append(rentaNew)
            }
        }
        catch{
            print("No se pudieron obetener las rentas")
        }
        return rentasAll
    }
    func selecRentas(fechaUno: Date, fechaDos: Date)->[String]{
        var rentasFe = [String]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        print("\(fechaUno)")
        print("\(fechaDos)")
        
        do{
            let stament = try db?.prepare("select arr.nombre, arr.apPat, apt.calle , re.monto_pago, re.fecha_pago from rentas re inner join contratos cn on re.contrato_id = cn.id inner join arrendatarios arr on cn.arren_id = arr.id inner join apartamentos apt on apt.id = cn.apt_id where re.fecha_pago between '\(fechaUno)' and  '\(fechaDos)' and re.pagado = 1 ")
            for row in stament!{
                /*let uno:String! = (row[4] as! String)
                print("\(uno)")
                let fecha = dateFormatter.date(from: row[4] as! String)*/
               let datos = "\(row[0]!) \(row[1]!) \(row[2]!) \(row[3]!) \(row[4]!)"
                rentasFe.append(datos)
            
            }
            
            
        }
        catch{
            print("No se pudo obtener las rentas lala")
        }
        return rentasFe
    }
    
  
    
    func rentasFechas(fechaIni: Date, fechaFin: Date)->[rentas]{
        var rentasFecha = [rentas]()
        let getRenta = tblRenta.join(tblContrato, on: tblRenta[contrato_id] == tblContrato[idCon]).join(tblArrendatario, on: tblContrato[arre_id] == tblArrendatario[idArr]).join(tblApartamentos, on: tblApartamentos[id] == tblContrato[apt_id]).filter(diaPagado >= fechaIni).filter(pagado == true)
        
              // let getRenta = "select * from rentas re join contratos cn on re.contrado_id = cn.id join arrendatarios arr on cn.arren_id = arr.id join apartamentos apt on cn.apt_id = apt.id where re.fecha_pago => \(fechaIni) and re.fecha_pago <= \(fechaFin) "
        do{
            let rentass = try db?.prepare(getRenta)
            for renta in rentass!{
                
                
                //  print("\(renta[diaVencimiento]) \(renta[nombre]) \(renta[calle]) \(renta[numero]))")
                 let rentaNew = rentas(idRenta: renta[tblRenta[idRenta]], contrato_id: renta[contrato_id], fecha_renta: renta[diaVencimiento],fecha_pago: renta[diaPagado], monto: renta[monto], nombre: renta[nombre]!, apPat: renta[apPat]!, calle: renta[calle]!, num: renta[numero]!)
                //let rentaNew - rentas
                rentasFecha.append(rentaNew)
            }
        }
        catch{
            print("No se pudieron obetener las rentas")
        }
        return rentasFecha
    
    }
    
    func checkfechas(fecha: Date){
       // let query = tblContrato.filter()
    
    }
    
    func queryAllAptsVacios() -> [Apartments] {
        var apartments = [Apartments]()
        let apart = tblApartamentos.filter(ocupado == false)
        
        do {
            for apartment in try db!.prepare(apart) {
                let newAPt = Apartments(id: apartment[id],
                                        calle: apartment[calle] ?? "",
                                        numero: apartment[numero]!,
                                        ciudad: apartment[ciudad]!,
                                        estado: apartment[estado]!,
                                        codigo: apartment[codPos],
                                        ocupado: apartment[ocupado]
                )
                
                apartments.append(newAPt)
            }
        } catch {
            print("No se puede obtener la lista")
        }
        for apt in apartments{
            print("apartamento = \(apt)")
        }
        return apartments
    }
    
    
    func getArrendatario(idPersona: Int64) -> [Arrendatarios] {
        var arrendatarios = [Arrendatarios]()
        
        do {
            for arrendatario in try db!.prepare(self.tblArrendatario) {
                if arrendatario[id] == idPersona{
                let newArr = Arrendatarios(id: arrendatario[id],
                                           nombre: arrendatario[nombre] ?? "",
                                           apPat: arrendatario[apPat]!,
                                           apMat: arrendatario[apMat]!,
                                           correo: arrendatario[correo]!,
                                           tel: arrendatario[tel]!)
                arrendatarios.append(newArr)
                return arrendatarios
                //apartments.append(newAPt)
                }
            }
        } catch {
            print("No se puede obtener la lista")
        }
        
        return arrendatarios
    }
    func getApartment(idAPt: Int64) -> [Apartments] {
        var apartments = [Apartments]()
        
        do {
            for apartment in try db!.prepare(self.tblApartamentos) {
                if apartment[id] == idAPt{
                    let newAPT = Apartments(id: apartment[id], calle: apartment[calle]!, numero: apartment[numero]!, ciudad: apartment[ciudad]!, estado: apartment[estado]!, codigo: apartment[codPos], ocupado: apartment[ocupado])
                    apartments.append(newAPT)
                    return apartments
                    //apartments.append(newAPt)
                }
            }
        } catch {
            print("No se puede obtener la lista")
        }
        
        return apartments
    }
    
    
    
    func queryAllArrendatarios() -> [Arrendatarios] {
        var arrendatarios = [Arrendatarios]()
        
        do {
            for arrendatario in try db!.prepare(self.tblArrendatario) {
                let newArr = Arrendatarios(id: arrendatario[id],
                                       nombre: arrendatario[nombre] ?? "",
                                       apPat: arrendatario[apPat]!,
                                       apMat: arrendatario[apMat]!,
                                       correo: arrendatario[correo]!,
                                       tel: arrendatario[tel]!)
                arrendatarios.append(newArr)
                
                //apartments.append(newAPt)
            }
        } catch {
            print("No se puede obtener la lista")
        }
        
        return arrendatarios
    }
    
    
    
    func deleteArren(idDel: Int64)->Bool{
        
        do{
            let ArrDel = tblArrendatario.filter(idArr == idDel)
            try db!.run(ArrDel.delete())
            print("El arrendatario fue borrado con exito")
            return true
        }
        catch{
            print("No se pudo borrar al arrendatario")
        }
        return false
    
    }
    
    func deleteContrato(idContra: Int64)-> Bool{
        do{
            let contDel = tblContrato.filter(idCon == idContra)
            try db!.run(contDel.delete())
            print("El contrato fue eliminado")
            return true
        }
        catch{
            print("No se pudo borrar el contrato")
        }
        return false
    }
    
    
    
    func updateArrend(updateArr: Arrendatarios)->Bool{
        
        let updateA = tblArrendatario.filter(idArr == updateArr.idArr)
        do {
            let updateB = updateA.update([nombre <- updateArr.getNom,apPat <- updateArr.getApPat, apMat <- updateArr.getApMat, correo <- updateArr.getCorreo, tel <- updateArr.getTel])
            if try db!.run(updateB) > 0 {
                print("Se actualizo el arrendatario con exito")
                return true
            }
        } catch {
            print("No se pudo actulizar el arrendatario")
        }
        
        return false
    }
    
    func updateRentas(idRent: Int64){
        
        let date = Date()
        let dateString:String = date.description
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        _ = formatter.date(from: dateString)
        
       
        let updateA = tblRenta.filter(idRenta == idRent)
        do{
            let updateB = updateA.update([diaPagado <- date,  pagado <- true])
            if try db!.run(updateB)>0{
                print("Se pago la renta")
            }
            
        
        
        }
        catch{
            print("No se pudo pagar la renta")
        }
        
    }
    
    func updateAptt(idApt: Int64, bandera: Bool)->Bool{
        let updateA = tblApartamentos.filter(id == idApt)
        do{
            let updateB = updateA.update(ocupado <- bandera)
            if try db!.run(updateB) > 0{
                print("se actulizo el estado")
                return true
            }
        } catch {
            print("no se pudo actulizar estado")
        }
        return false
    }
    
    func delApt(delApt: Int64)->Bool{
        do{
            let aptDel = tblApartamentos.filter(id == delApt)
            try db!.run(aptDel.delete())
            print("El apartamento fue borrado con exito")
            return true
        }
        catch{
            print("No se pudo borrar al arrendatario")
        }
        return false
    
    }
    
    func updateApt(updateApt: Apartments)->Bool{
        
        let updateA = tblApartamentos.filter(id == updateApt.getId)
        do {
            let updateB = updateA.update([calle <- updateApt.getCalle, numero <- updateApt.getNumero, ciudad <- updateApt.getCiudad, estado <- updateApt.getEstado, codPos <- updateApt.getCodigo, ocupado <- updateApt.getOcupado])
            if try db!.run(updateB) > 0 {
                print("Se actualizo apt con exito")
                return true
            }
        } catch {
            print("No se pudo actulizar el apt")
        }
        
        return false
        
    
    }
    
    func updateRenta(idContrato: Int64, renta: Double)-> Bool{
        let updateA = tblContrato.filter(idCon == idContrato)
        do{
            let updateB = updateA.update([monto <- renta])
            if try db!.run(updateB)>0{
                print("Se actualizo la renta")
                return true
            }
        }
        catch{
            print("No se pudo actualizar la renta")
        }
        return false
    }*/
    
    
 
}


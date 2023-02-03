//
//  TahminEkraniVC.swift
//  GuessTheNumber
//
//  Created by Serhat on 3.02.2023.
//

import UIKit

class TahminEkraniVC: UIViewController {

    @IBOutlet weak var labelYardim: UILabel!
    @IBOutlet weak var labelKalanHak: UILabel!
    @IBOutlet weak var textFieldTahmin: UITextField!
    
    var rastgeleSayi:Int?
    var kalanHak:Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //rastgeleSayi = Int(arc4random_uniform(100))
        rastgeleSayi = Int.random(in: 0...100)
        print("Rastgele tutulan sayı: \(rastgeleSayi!)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gelenVeri = sender as? Bool{
            let gidilecekVC = segue.destination as! SonucEkraniVC
            gidilecekVC.sonuc = gelenVeri
        }
    }
    
    @IBAction func btnTahminEt(_ sender: Any) {
        labelYardim.isHidden = false
        kalanHak -= 1
        
        if let veri = textFieldTahmin.text{
            if let tahmin = Int(veri){
                if kalanHak != 0{
                    if tahmin == rastgeleSayi!{
                        let sonuc = true
                        performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)
                        return
                    }
                    if tahmin > rastgeleSayi!{
                        labelYardim.text = "AZALT"
                        labelKalanHak.text = "Kalan Hak: \(kalanHak)"
                    }
                    if tahmin < rastgeleSayi!{
                        labelYardim.text = "ARTTIR"
                        labelKalanHak.text = "Kalan Hak: \(kalanHak)"
                    }
                    if kalanHak == 0{
                        let sonuc = false
                        performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)
                    }
                    textFieldTahmin.text = ""
                }
                
            }
        }
        
        
    }
}

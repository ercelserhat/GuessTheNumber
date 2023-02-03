//
//  SonucEkraniVC.swift
//  GuessTheNumber
//
//  Created by Serhat on 3.02.2023.
//

import UIKit

class SonucEkraniVC: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var imgSonuc: UIImageView!
    
    var sonuc:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Sonuç Ekranı"
        
        print("Sonuç: \(sonuc!)")
        
        if sonuc!{
            labelSonuc.text = "KAZANDINIZ!"
            imgSonuc.image = UIImage(named: "mutlu_resim")
        }else{
            labelSonuc.text = "KAYBETTİNİZ!"
            imgSonuc.image = UIImage(named: "uzgun_resim")
        }
    }
    
    @IBAction func btnTekrarOyna(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

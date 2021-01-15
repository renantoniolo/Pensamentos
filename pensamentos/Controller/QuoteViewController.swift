//
//  QuoteViewController.swift
//  pensamentos
//
//  Created by Renan Rocha on 15/01/21.
//

import UIKit

class QuoteViewController: UIViewController {

    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lblPensamento: UILabel!
    @IBOutlet weak var lblAutor: UILabel!
    
    let configuration = Configuration.shared
    let quotemanager: QuotesManager = QuotesManager()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        loadViewConfig()
        prepareQuote()
    }
    
    func loadViewConfig(){
        
        view.backgroundColor = configuration.colorScheme == 0 ? .white : UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0)
        lblPensamento.textColor = configuration.colorScheme == 0 ? .black : .white
        lblAutor.textColor = configuration.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func prepareQuote(){
        
        if(configuration.autoRefresh){
            timer.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: configuration.timeInterval, repeats: true, block: { (timer) in
                self.showRandQuote()
            })
        }
        self.showRandQuote()
    }
    
    func showRandQuote(){
        let quote = quotemanager.getRandonQuote()
        
        lblAutor.text = quote.author
        lblPensamento.text = quote.quote
        imgFoto.image = UIImage(named: quote.image)
        imgBackground.image = UIImage(named: quote.image)
        
        lblAutor.alpha = 0.0
        lblPensamento.alpha = 0.0
        imgFoto.alpha = 0.0
        imgBackground.alpha = 0.0
        
        UIView.animate(withDuration: 2.5, animations: {
            
            self.lblAutor.alpha = 1.0
            self.lblPensamento.alpha = 1.0
            self.imgFoto.alpha = 1.0
            self.imgBackground.alpha = 0.25
            
        })
    }

}

//
//  SettingViewController.swift
//  pensamentos
//
//  Created by Renan Rocha on 14/01/21.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var swAlterMode: UISwitch!
    @IBOutlet weak var slTimer: UISlider!
    @IBOutlet weak var lblExibirTime: UILabel!
    @IBOutlet weak var scColor: UISegmentedControl!
    
    let configuration = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        loadViewValues()
    }
    
    func loadViewValues(){
        
        swAlterMode.setOn(configuration.autoRefresh, animated: false)
        slTimer.setValue(Float(configuration.timeInterval), animated: false)
        scColor.selectedSegmentIndex = configuration.colorScheme
        alterLabelInterval(valor: configuration.timeInterval)
    }
    
    func alterLabelInterval(valor:Double){
        lblExibirTime.text = "Mudar após \(Int(valor)) segundos"
    }
    
    @IBAction func ChangeMode(_ sender: UISegmentedControl) {
        
        configuration.colorScheme = sender.selectedSegmentIndex
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let valor = Double(round(sender.value))
        configuration.timeInterval = valor
        alterLabelInterval(valor: valor)
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        configuration.autoRefresh = sender.isOn
    }
}

//
//  Configuration.swift
//  pensamentos
//
//  Created by Renan Rocha on 15/01/21.
//

import Foundation

enum userDefaultKey: String {
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case autorefresh = "autorefresh"
}


class Configuration{
    
    let defaults = UserDefaults.standard
    static var shared: Configuration = Configuration()
    
    
    init(){
        if(defaults.double(forKey: userDefaultKey.timeInterval.rawValue) < 1){
            defaults.setValue(8, forKey: userDefaultKey.timeInterval.rawValue)
        }
    }
    
    var timeInterval: Double {
        get{
            return defaults.double(forKey: userDefaultKey.timeInterval.rawValue)
        }
        set{
            defaults.setValue(newValue, forKey: userDefaultKey.timeInterval.rawValue)
        }
    }
    
    var colorScheme: Int {
        get{
            return defaults.integer(forKey: userDefaultKey.colorScheme.rawValue)
        }
        set{
            defaults.setValue(newValue, forKey: userDefaultKey.colorScheme.rawValue)
        }
    }
    
    var autoRefresh: Bool {
        get{
            return defaults.bool(forKey: userDefaultKey.autorefresh.rawValue)
        }
        set{
            defaults.setValue(newValue, forKey: userDefaultKey.autorefresh.rawValue)
        }
    }
    
}

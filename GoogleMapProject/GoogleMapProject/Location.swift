//
//  Location.swift
//  GoogleMapProject
//
//  Created by Maan Abdullah on 06/09/2022.
//

import Foundation

struct Location{
    let lat: Double
    let long: Double
}


let arrLocation1 = [Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.781532535275574, long: 46.731239023044544),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.781532535275574, long: 46.731239023044544),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.781532535275574, long: 46.731239023044544),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.781229, long: 46.731366),
                    Location(lat: 24.778541, long: 46.734157),
                    Location(lat: 24.778073, long: 46.733169),
                    Location(lat: 24.783606, long: 46.731109),
                    Location(lat: 24.780411, long: 46.733470),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781229, long: 46.731366),
                    Location(lat: 24.778541, long: 46.734157),
                    Location(lat: 24.778073, long: 46.733169),
                    Location(lat: 24.783606, long: 46.731109),
                    Location(lat: 24.780411, long: 46.733470),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781229, long: 46.731366),
                    Location(lat: 24.778541, long: 46.734157),
                    Location(lat: 24.778073, long: 46.733169),
                    Location(lat: 24.783606, long: 46.731109),
                    Location(lat: 24.780411, long: 46.733470),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781229, long: 46.731366),
                    Location(lat: 24.778541, long: 46.734157),
                    Location(lat: 24.778073, long: 46.733169),
                    Location(lat: 24.783606, long: 46.731109),
                    Location(lat: 24.780411, long: 46.733470),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781229, long: 46.731366),
                    Location(lat: 24.778541, long: 46.734157),
                    Location(lat: 24.778073, long: 46.733169),
                    Location(lat: 24.783606, long: 46.731109),
                    Location(lat: 24.780411, long: 46.733470),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.781532535275574, long: 46.731239023044544),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.781532535275574, long: 46.731239023044544),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.781532535275574, long: 46.731239023044544),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.78150096054407, long: 46.7313234470652),
                    Location(lat: 24.781516949787648, long: 46.73119873106995),
                    Location(lat: 24.781626019154015, long: 46.73128579467771),
                    Location(lat: 24.781229, long: 46.731366),
                    Location(lat: 24.778541, long: 46.734157),
                    Location(lat: 24.778073, long: 46.733169),
                    Location(lat: 24.783606, long: 46.731109),
                    Location(lat: 24.780411, long: 46.733470),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781229, long: 46.731366),
                    Location(lat: 24.778541, long: 46.734157),
                    Location(lat: 24.778073, long: 46.733169),
                    Location(lat: 24.783606, long: 46.731109),
                    Location(lat: 24.780411, long: 46.733470),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781229, long: 46.731366),
                    Location(lat: 24.778541, long: 46.734157),
                    Location(lat: 24.778073, long: 46.733169),
                    Location(lat: 24.783606, long: 46.731109),
                    Location(lat: 24.780411, long: 46.733470),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781229, long: 46.731366),
                    Location(lat: 24.778541, long: 46.734157),
                    Location(lat: 24.778073, long: 46.733169),
                    Location(lat: 24.783606, long: 46.731109),
                    Location(lat: 24.780411, long: 46.733470),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781229, long: 46.731366),
                    Location(lat: 24.778541, long: 46.734157),
                    Location(lat: 24.778073, long: 46.733169),
                    Location(lat: 24.783606, long: 46.731109),
                    Location(lat: 24.780411, long: 46.733470),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.781658, long: 46.731066),
                    Location(lat: 24.782666, long: 46.732068)]

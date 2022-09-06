//
//  ViewController.swift
//  Google-Maps-Cocoapod
//
//  Created by SAF on 05/09/2022.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, GMSMapView {

    @IBOutlet weak var googleMaps: GMSMapView!
    @IBOutlet weak var Myaddress: UILabel!
    
    //MARK: - var
    // CLLocationManager()  مسؤل عن الحصول علي معلومات الموقع من ايفون
    var locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManger.delegate = self
        locationManger.requestAlwaysAuthorization()
        // startUpdatingLocation() الحصول علي موقع المستخدم
        locationManger.startUpdatingLocation()
        
        //mapView.delegate = self

        
        
    let center = CLLocationCoordinate2DMake(24.777, 46.756)
    let region = CLCircularRegion(center: center, radius: 100, identifier: "Tuwaig")
    locationManger.startMonitoring(for: region)

        googleMaps.delegate = self
        googleMaps.isMyLocationEnabled = true
       //يرجع المستخدم الي موقعه
        googleMaps.settings.myLocationButton = true
    
}

} // end of class

extension ViewController: CLLocationManagerDelegate, GMSMapViewDelegate {

func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
    print("enter")
}
func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
    print("exit")
}

func  locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let lastLocation = locations.last{
        let longitude = lastLocation.coordinate.longitude
        print("longitude: \(longitude)")
        let latitude = lastLocation.coordinate.latitude
        print("latitude: \(latitude)")
        let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 18.0)
        
        //self.mapView.animate(to: camera)
    }
}
   
        // للتحويل الموقع الي العنوان النصي
    func locationManger (coordinates: CLLocationCoordinate2D){
        // GMSGeocoder() --> تحويل الاحديثيات الي عنوان نصي
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(coordinates){
            response, error in
            if let adress = response?.firstResult(),
               let lines = adress.lines{
                // اضافة هذ العنوان الي lable
                self.Myaddress.text = lines.joined(separator: "\n")
            }
        }
    }
    

    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let latitude = mapView.camera.target.latitude
        let longitude = mapView.camera.target.longitude
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        locationManger(coordinates: location)
    }
    } // end extension

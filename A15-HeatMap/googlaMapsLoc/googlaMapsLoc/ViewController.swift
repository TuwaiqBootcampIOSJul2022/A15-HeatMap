//
//  ViewController.swift
//  googlaMapsLoc
//
//  Created by Farah Alyousef on 09/02/1444 AH.
//
import CoreLocation
import UIKit
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate {
let manager = CLLocationManager()
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
//        locationManager.requestAlwaysAuthorization()
//        locationManager.startUpdatingLocation()
//        let center = CLLocationCoordinate2DMake(24.3212, 46.365)
//        let region = CLCircularRegion(center: center, radius: 100, identifier: "Olaya")
//      locationManager.startMonitoring(for: region)
        GMSServices.provideAPIKey("AIzaSyB-DT_6RGXPQivtHLYWV5kMgXh70bgsZJg")

        print("Lincense: \n\n\(GMSServices.openSourceLicenseInfo())")
          }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        let coordinate = location.coordinate
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 1)
                let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
                self.view.addSubview(mapView)

                // Creates a marker in the center of the map.
                let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
                marker.position = coordinate
                marker.title = "Sydney"
                marker.snippet = "Australia"
                marker.map = mapView
    }
}

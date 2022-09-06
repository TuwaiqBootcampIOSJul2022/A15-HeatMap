//
//  ViewController.swift
//  GoogleMap
//
//  Created by Hessa on 10/02/1444 AH.
//

import UIKit
import GoogleMaps
import CoreLocation
import DTMHeatmap
class ViewController: UIViewController,CLLocationManagerDelegate, GMSMapViewDelegate {
    
    var postArray = [AnyObject]()
    var posts:NSArray = []
    var bounds = GMSCoordinateBounds()
    @IBOutlet weak var GoogelMapsView: GMSMapView!
 
    
    var locationManger = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManger.delegate = self
        locationManger.requestAlwaysAuthorization()
        locationManger.startUpdatingLocation()
        
    let center = CLLocationCoordinate2DMake(24.774265, 46.738586)
     let region = CLCircularRegion(center: center, radius: 100, identifier: "KeyLocation")

        
        locationManger.startMonitoring(for: region)
        
        GoogelMapsView.delegate = self
        GoogelMapsView.isMyLocationEnabled = true
        GoogelMapsView.settings.myLocationButton = true
    
    }

   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    if let lastlocation = locations.last {
    let longtidu = lastlocation.coordinate.longitude
    let latiduid = lastlocation.coordinate.latitude
            print("longitude: \(longtidu)")
            print("latiditd: \(latiduid)")
    let camera1 = GMSCameraPosition(latitude: latiduid, longitude: longtidu, zoom: 18)
        
        GoogelMapsView.camera = camera1
        }
 
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker(position: coordinate)
       marker.icon = UIImage(named: "imgpen")
       marker.map = mapView
    }
    
}


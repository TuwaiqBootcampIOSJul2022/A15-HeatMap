//
//  ViewController.swift
//  HeatMap
//
//  Created by Ruba on 09/02/1444 AH.
//

import UIKit
import GoogleMaps
import GoogleMapsUtils

class ViewController: UIViewController{

    private var list = [GMUWeightedLatLng]()
    private var heatMapLayer : GMUHeatmapTileLayer!
    
    private var color1 = [UIColor.green , UIColor.red]
    private var startPints : [NSNumber] = [0.2, 1.0]
    
    var locationManger = CLLocationManager()
    
    @IBOutlet weak var googleMapsWiew: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heatMapLayer = GMUHeatmapTileLayer()
        updateHeatMap()
        
        heatMapLayer.radius = 80
        heatMapLayer.opacity = 0.7
        heatMapLayer.gradient = GMUGradient(colors: color1, startPoints: startPints, colorMapSize: 250)
        
         heatMapLayer.map = googleMapsWiew
        googleMapsWiew.delegate = self
        googleMapsWiew.isMyLocationEnabled = true
        googleMapsWiew.settings.myLocationButton = true

        
        
        
    }
  
    
    func Locations() -> [Location]{
        

        let location : [Location] = [Location(lat: 24.774265, lng: 46.738586), Location(lat: 24.774276, lng: 46.738539), Location(lat: 24.774229, lng: 46.738599), Location(lat: 24.774288, lng: 46.738511), Location(lat: 24.774211, lng: 46.738531),Location(lat: 24.774223, lng: 46.738576),Location(lat: 24.774256, lng: 46.738539) ,Location(lat: 24.774938 , lng: 46.738584)]
        
        return location
    }
  
    func updateHeatMap(){
        
       let loc = Locations()
        for l in loc{
            let lat = l.lat
            let long = l.lng
            
            let coords = GMUWeightedLatLng(coordinate:CLLocationCoordinate2DMake(lat,long), intensity: 1.0)
            list.append(coords)
        }
        heatMapLayer.weightedData = list
        heatMapLayer.map = googleMapsWiew
        heatMapLayer.clearTileCache()
    }
   
    


}
extension ViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last{
            let longitude = lastLocation.coordinate.longitude
            let latitude = lastLocation.coordinate.latitude

            let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 17)
            googleMapsWiew = GMSMapView.map(withFrame: .zero, camera: camera)
            googleMapsWiew.camera = camera
       }
    
    }
    
    
}
extension ViewController: GMSMapViewDelegate {
    
}

struct Location {
     var lat: Double
     var lng: Double

 }

//
//  ViewController.swift
//  GoogleMapsKit
//
//  Created by Waad on 09/02/1444 AH.
//

import UIKit
import GoogleMaps
import GoogleMapsUtils
import CoreLocation

class ViewController: UIViewController, GMSMapViewDelegate,CLLocationManagerDelegate{

    @IBOutlet weak var GoogleMapView: GMSMapView!
    
    @IBOutlet weak var Label: UILabel!
    
    //HEAT MAP
    var list = [GMUWeightedLatLng]()
    var heatmapLayer: GMUHeatmapTileLayer!
    var gradientColors = [UIColor.green, UIColor.red]
    var gradientsStartPoints = [0.2 , 1.0] as [NSNumber]
    
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        GoogleMapView.delegate = self
        GoogleMapView.isMyLocationEnabled = true
        
        // for button
        GoogleMapView.settings.myLocationButton = true
        
        settingLanelDesign()
        
        //Heat Map
        heatmapLayer = GMUHeatmapTileLayer()
        heatmapLayer.radius = 90
        heatmapLayer.opacity = 0.8
        heatmapLayer.gradient = GMUGradient(colors: gradientColors, startPoints: gradientsStartPoints, colorMapSize: 256)
        heatmapLayer.map = GoogleMapView
    }
    func settingLanelDesign() {
        Label.layer.masksToBounds = true
        Label.layer.cornerRadius  = 30
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func updateHeatMap(lat: Double , lng: Double)
    {
        let coords = GMUWeightedLatLng(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng ), intensity: 1.0)
        
        list.append(coords)
        heatmapLayer.weightedData = list
        heatmapLayer.map = GoogleMapView
        heatmapLayer.clearTileCache()
    }
    
    private func mapView(_ mapView: GMSMapView, didTap coordinate: CLLocationCoordinate2D){
        updateHeatMap(lat: coordinate.latitude, lng: coordinate.longitude)
    }
//}


//extension ViewController: CLLocationManagerDelegate
//{
    // last location the user move on "get current location "
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
         if let lastLocation = locations.last {
            let longitude = lastLocation.coordinate.longitude
            let latitude  = lastLocation.coordinate.latitude
           
            print("longitude: \(longitude)")
            print("latitude:  \(latitude)")
             
             let cam = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 17.0)
             GoogleMapView.camera = cam
             
             self.GoogleMapView.animate(to: cam)
            // self.locationManager.stopUpdatingLocation()
        }
    }
        // add pin when the user long press
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
       
        let marker = GMSMarker()
        let markerLat = coordinate.latitude
        let markerLong = coordinate.longitude
        
        
        marker.position = coordinate
        marker.title = "coordinates"
        marker.snippet = "\(markerLat)\n\(markerLong)"   // Snippet text, shown beneath the title in the info window when selected.
        marker.map = mapView
        
    }
//}
// implmentation
//extension ViewController: GMSMapViewDelegate
//{
    // Address Label
    func myLocation(cordinates: CLLocationCoordinate2D)
    {                   //class GMS
        let geocoder =  GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(cordinates)
        {
            responds, error in
            if let adress = responds?.firstResult(),
               let lines = adress.lines {         // city , zip code , street
                self.Label.text = lines.joined(separator: "\n")
               }
        }
    }
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
         let latitude = mapView.camera.target.latitude
        let longitude = mapView.camera.target.longitude
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        myLocation(cordinates: location)
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        return false
    }

}//end

//
//  ViewController.swift
//  MyFirstMap
//
//  Created by AlenaziHazal on 09/02/1444 AH.
//

import UIKit
import GoogleMaps
import CoreLocation
import GoogleMapsUtils
class ViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var myLocationLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    
     var list = [GMUWeightedLatLng]()
     var heatmaplayer:GMUHeatmapTileLayer!
    var gradiColors = [UIColor.green,UIColor.red]
    var gradiSartPoint = [0.2,1.0] as [NSNumber]
    let locationManeger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heatmaplayer = GMUHeatmapTileLayer()
        heatmaplayer.radius = 150
        heatmaplayer.opacity = 0.8
        heatmaplayer.gradient = GMUGradient(colors: gradiColors, startPoints: gradiSartPoint, colorMapSize: 256)
        heatmaplayer.map = mapView
        
        locationManeger.delegate = self
        locationManeger.requestAlwaysAuthorization()
       // let def_loc = locationManeger.location?.coordinate
        if CLLocationManager.locationServicesEnabled(){
        locationManeger.delegate = self
        locationManeger.desiredAccuracy = kCLLocationAccuracyBest
        locationManeger.startUpdatingLocation()
        }
//        let camera = GMSCameraPosition(latitude: def_loc!.latitude, longitude: def_loc!.longitude, zoom: 17)
//        mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        daplcated()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longtude = location.coordinate.longitude
            let camera = GMSCameraPosition(latitude: latitude, longitude: longtude, zoom: 17)
            self.mapView.animate(to: camera)
            self.locationManeger.stopUpdatingLocation()
        }
    }
   
    func myLocation (coordinates:CLLocationCoordinate2D){
        let geo = GMSGeocoder()
        geo.reverseGeocodeCoordinate(coordinates){
            responds,error in
            if let adress = responds?.firstResult(),
               let lines = adress.lines{
                self.myLocationLabel.text = lines.joined(separator: "\n")
            }
        }
    }
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let latitude = mapView.camera.target.latitude
        let longtude = mapView.camera.target.longitude
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longtude)
        myLocation(coordinates: location)
    }
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
    }
    func updateHeatMap(lat:Double, lng: Double){
        let coords = GMUWeightedLatLng(coordinate:CLLocationCoordinate2DMake(lat , lng ), intensity: 1.0)
        list.append(coords)
        heatmaplayer.weightedData = list
        heatmaplayer.map = mapView
        heatmaplayer.clearTileCache()
    }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        updateHeatMap(lat: coordinate.latitude, lng: coordinate.longitude)
    }
    func daplcated(){
        for a in 0..<29{
            list.append(GMUWeightedLatLng(coordinate: CLLocationCoordinate2D(latitude: 24.774265, longitude: 46.738586 ), intensity: 1.0))
            list.append(GMUWeightedLatLng(coordinate: CLLocationCoordinate2D(latitude: 27.774265, longitude: 46.438586 ), intensity: 1.0))
            list.append(GMUWeightedLatLng(coordinate: CLLocationCoordinate2D(latitude: 25.774265, longitude: 46.638586 ), intensity: 1.0))
            list.append(GMUWeightedLatLng(coordinate: CLLocationCoordinate2D(latitude: 23.650265, longitude: 46.738586 ), intensity: 1.0))
            list.append(GMUWeightedLatLng(coordinate: CLLocationCoordinate2D(latitude: 24.600265, longitude: 46.738586 ), intensity: 1.0))
            list.append(GMUWeightedLatLng(coordinate: CLLocationCoordinate2D(latitude: 24.80065, longitude: 46.738586 ), intensity: 1.0))
            list.append(GMUWeightedLatLng(coordinate: CLLocationCoordinate2D(latitude: 24.80065, longitude: 46.808586 ), intensity: 1.0))
            list.append(GMUWeightedLatLng(coordinate: CLLocationCoordinate2D(latitude: 24.80065, longitude: 46.508586 ), intensity: 1.0))
            heatmaplayer.weightedData = list
            heatmaplayer.map = mapView
            heatmaplayer.clearTileCache()
        }
    }
}


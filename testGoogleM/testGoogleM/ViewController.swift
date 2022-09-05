//
//  ViewController.swift
//  testGoogleM
//
//  Created by Faisal Almutairi on 09/02/1444 AH.
//

import UIKit
import GoogleMaps
import CoreLocation
import GoogleMapsUtils

class ViewController: UIViewController, GMSMapViewDelegate {

    @IBOutlet weak var googleMapsView: GMSMapView!
    let locationManager = CLLocationManager()
    
    let gradientColors: [UIColor] = [.green, .red]
    let gradientStartPoints: [NSNumber] = [0.2, 1.0]
    
    private var mapView: GMSMapView!
    private var heatmapLayer : GMUHeatmapTileLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heatmapLayer = GMUHeatmapTileLayer()
        addHeatmap()
        heatmapLayer.map = mapView
        heatmapLayer.gradient = GMUGradient(colors: gradientColors, startPoints: gradientStartPoints, colorMapSize: 256)
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        googleMapsView.delegate = self
        googleMapsView.isMyLocationEnabled = true
        googleMapsView.settings.myLocationButton = true

    }
    
    func addHeatmap() {

        guard let path = Bundle.main.url(forResource: "police_stations", withExtension: "json") else {
            print("url problem")
          return
        }
        guard let data = try? Data(contentsOf: path) else {
            print("data problem")
          return
        }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
            print("json problem")
          return
        }
        guard let object = json as? [[String: Any]] else {
          print("Could not read the JSON.")
          return
        }

        var list = [GMUWeightedLatLng]()
        for item in object {
          let lat = item["lat"] as! CLLocationDegrees
          let lng = item["lng"] as! CLLocationDegrees
          let coords = GMUWeightedLatLng(
            coordinate: CLLocationCoordinate2DMake(lat, lng),
            intensity: 1.0
          )
          list.append(coords)
        }
        
        heatmapLayer.weightedData = list
      }
}

extension ViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let lastLocation = locations.last{
            
            let lat = lastLocation.coordinate.latitude
            let long = lastLocation.coordinate.longitude
            print("\(long) longitude")
            print("\(lat) latitude")
            let camera = GMSCameraPosition(latitude: lat, longitude: long, zoom: 17.0)
            self.googleMapsView.animate(to: camera)
            self.locationManager.stopUpdatingLocation()

        }
    }
    
    
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {

        let lat = mapView.camera.target.latitude
        let long = mapView.camera.target.longitude
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        false
    }

}


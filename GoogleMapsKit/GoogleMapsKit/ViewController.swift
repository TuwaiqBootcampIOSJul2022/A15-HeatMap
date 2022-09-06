//
//  ViewController.swift
//  GoogleMapsKit
//
//  Created by Rashed Shrahili on 09/02/1444 AH.
//

import UIKit
import GoogleMaps
import CoreLocation
import GoogleMapsUtils

class ViewController: UIViewController {
    
    //MARK: - IBOutLet
    @IBOutlet weak var googleMapsView: GMSMapView!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    var heatmapLayer: GMUHeatmapTileLayer!
    
    
    
    //MARK: - Variables
    var locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        googleMapsView.delegate = self
        googleMapsView.isMyLocationEnabled = true
        googleMapsView.settings.myLocationButton = true
        
        heatmapLayer = GMUHeatmapTileLayer()
        Heatmap()
        heatmapLayer.map = googleMapsView
    }
    
    func myLocation(coordinates: CLLocationCoordinate2D) {
        
        let geocoder = GMSGeocoder()
        
        geocoder.reverseGeocodeCoordinate(coordinates) {
            response, error in
            
            if let address = response?.firstResult(),
               let lines = address.lines {
                
                self.addressLabel.text = lines.joined(separator: "\n")
            }
        }
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        
        let latitude = googleMapsView.camera.target.latitude
        let longtude = googleMapsView.camera.target.longitude
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longtude)
        
        myLocation(coordinates: location)
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        
        let marker = GMSMarker()
        
        let markerLatitude = coordinate.latitude
        let markerLongitude = coordinate.longitude
        
        marker.position = coordinate
        
        print("{\"latitude\" : \(markerLatitude), \"longtude\" : \(markerLongitude)},")
        
        marker.map = googleMapsView
    }
    
    func Heatmap() {
        
        guard let path = Bundle.main.url(forResource: "HeatPositions", withExtension: "json") else {
            
            print("File Not Found")
            return
            
        }
        guard let data = try? Data(contentsOf: path) else {
            
            print("Can't Convert File to Data")
            return
            
        }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
            
            print("Can't Serilize File")
            return
            
        }
        guard let object = json as? [[String: Any]] else {
          print("Can't Read The File")
          return
        }

        var list = [GMUWeightedLatLng]()
        for item in object {
          let lat = item["latitude"] as! CLLocationDegrees
          let lng = item["longtude"] as! CLLocationDegrees
          let coords = GMUWeightedLatLng(
            coordinate: CLLocationCoordinate2DMake(lat, lng),
            intensity: 1.0
          )
          list.append(coords)
        }

        // Add the latitude and longtude to the heatmap layer.
        heatmapLayer.weightedData = list
        
        let gradientColors: [UIColor] = [.green, .red]
        let gradientStartPoints: [NSNumber] = [0.2, 0.4]
        heatmapLayer.gradient = GMUGradient(
          colors: gradientColors,
          startPoints: gradientStartPoints,
          colorMapSize: 256
        )
        heatmapLayer.radius = 80
        heatmapLayer.opacity = 0.8
        
      }
    
}

extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let lastLocation = locations.last {
            
            let longitude = lastLocation.coordinate.longitude
            let latitude = lastLocation.coordinate.latitude
            
//            print("Longtude: \(longitude)")
//            print("Latitude: \(latitude)")
            
            print("{}")
            
            let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 17)

            googleMapsView.camera = camera
            locationManager.stopUpdatingLocation()
        }
    }
}

extension ViewController : GMSMapViewDelegate {
    
    
}


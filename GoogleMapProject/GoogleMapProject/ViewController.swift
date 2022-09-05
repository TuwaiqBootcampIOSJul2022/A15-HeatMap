//
//  ViewController.swift
//  GoogleMapProject
//
//  Created by Maan Abdullah on 05/09/2022.
//

import UIKit
import GoogleMaps
import CoreLocation
import GoogleMapsUtils
class ViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var googleMapView: GMSMapView!
    
    //MARK: - Variables
    var heatMapLayer: GMUHeatmapTileLayer!
    var locationManager = CLLocationManager()
    var clusterManager: GMUClusterManager!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLocationManager()
        
        setupHeatMap()
        setupGoogleView()
        
    }

    //MARK: - Methods
     func setLocationManager() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
     func setupHeatMap() {
        heatMapLayer = GMUHeatmapTileLayer()
        addHeatMap()
        heatMapLayer.map = googleMapView
    }
    
     func setupGoogleView() {
        googleMapView.isMyLocationEnabled = true
        googleMapView.settings.myLocationButton = true
    }
}


// MARK: - Adopt CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let lastLocation = locations.last {
            
            let longitude = lastLocation.coordinate.longitude
            let latitude = lastLocation.coordinate.latitude
            
            let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 17)

            googleMapView.camera.self = camera
            self.googleMapView.animate(to: camera)
            
        }
    }
}

// MARK: - Adding HeatMap
extension ViewController{
    func addHeatMap(){
        let gColors: [UIColor] = [.green, .red]
        let gStartPoints: [NSNumber] = [0.09, 0.5]
        
        heatMapLayer.gradient = GMUGradient(colors: gColors, startPoints: gStartPoints, colorMapSize: 256)
        heatMapLayer.radius = 90
        heatMapLayer.opacity = 0.7
        
        var list = [GMUWeightedLatLng]()
        for location in arrLocation1{
            let coordinate = GMUWeightedLatLng(coordinate: CLLocationCoordinate2D(latitude: location.lat, longitude: location.long), intensity: 1.0)
            list.append(coordinate)
        }
        heatMapLayer.weightedData = list
    }
}

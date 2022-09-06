//
//  ViewController.swift
//  GoogleMapsApp
//
//  Created by REOF ALMESHARI on 05/09/2022.
//

import UIKit
import GoogleMaps
import CoreLocation
import GoogleMapsUtils
class ViewController: UIViewController {
    @IBOutlet weak var gooleMapView: GMSMapView!
    var list = [GMUWeightedLatLng]()
    private var heatmapLayer: GMUHeatmapTileLayer!

    var locationManger = CLLocationManager()
    
    var gradintColor = [UIColor.green , UIColor.red]
    var gradintStartPoint = [0.2,1.0] as [NSNumber]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManger.delegate = self
        locationManger.requestAlwaysAuthorization()
        
        locationManger.startUpdatingLocation()
        
        
        gooleMapView.delegate = self
        gooleMapView.isMyLocationEnabled = true
        gooleMapView.settings.myLocationButton = true
        
        
        heatmapLayer = GMUHeatmapTileLayer()
        heatmapLayer.radius = 80
        heatmapLayer.opacity = 0.8
        heatmapLayer.gradient = GMUGradient(colors: gradintColor, startPoints: gradintStartPoint, colorMapSize: 256)
        heatmapLayer.map = gooleMapView
    }
    func addHeatmap(latitude : Double , longitude :Double) {

        let coordinate = GMUWeightedLatLng(coordinate: CLLocationCoordinate2DMake(latitude as! CLLocationDegrees, longitude as! CLLocationDegrees), intensity: 1.0)
        
        list.append(coordinate)
        heatmapLayer.weightedData = list
        heatmapLayer.map = gooleMapView
        heatmapLayer.clearTileCache()

   
      }
    }
          




extension ViewController : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            let latitude = lastLocation.coordinate.latitude
            let longitude = lastLocation.coordinate.longitude
            let camera = GMSMutableCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 17)
            gooleMapView.camera = camera
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        addHeatmap(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}
extension ViewController : GMSMapViewDelegate { }

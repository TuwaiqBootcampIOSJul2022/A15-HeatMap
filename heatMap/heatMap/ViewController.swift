//
//  ViewController.swift
//  heatMap
//
//  Created by user on 09/02/1444 AH.
//

import UIKit
import GoogleMaps
//import GooglePlaces
import GoogleMapsUtils
import CoreLocation
struct Loction{
    var latitude:Double
    var longitude:Double
    
}

class ViewController: UIViewController, CLLocationManagerDelegate,GMSMapViewDelegate {
    var heatmaplyer:GMUHeatmapTileLayer!
    @IBOutlet weak var mapView: GMSMapView!
    let latitude = 24.8607
    let longitude = 46.62362
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupMap()
        setUpHeatMap()
        
                }
    
    func getDummyLocations()->[Loction]{
        let Arrayloction : [Loction] = [
            Loction(latitude: 24.8607045, longitude: 46.62362557),
            
            Loction(latitude: 24.8607675, longitude: 46.62362309),
            
            Loction(latitude: 24.86072987, longitude: 46.62362389),
            
            Loction(latitude: 24.8607836, longitude: 46.62362190),
            
            Loction(latitude: 24.8607731, longitude: 46.62362443),
        
        ]
        return Arrayloction
    }
    func addHeatMap(){
        var list = [GMUWeightedLatLng]()
        let locations = getDummyLocations()
        for location in locations {
            let lat = location.latitude
            let longi = location.longitude
            let coords = GMUWeightedLatLng(coordinate: CLLocationCoordinate2DMake(lat,longi), intensity: 3.0)
            list.append(coords)
        }
        heatmaplyer.weightedData = list
        
    }
    
    func setUpHeatMap(){
        heatmaplyer = GMUHeatmapTileLayer()
        addHeatMap()
        heatmaplyer.map = mapView
        
    }
    
    func setupMap(){
        let camer = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude), zoom: 16.0)
        mapView.camera = camer
        
    }

    }
    




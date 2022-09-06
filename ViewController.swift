//
//  ViewController.swift
//  HeatMap
//
//  Created by Kholoud Almutairi on 09/02/1444 AH.
//

import UIKit
import GoogleMaps
import GoogleMapsUtils
import CoreLocation



class ViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    private var list = [location]()
     var heatmapLayer: GMUHeatmapTileLayer!
     var locationManger = CLLocationManager()

    
//    private var gradcolors = [UIColor.green , UIColor.red]
//    private var gardientStartPoint = [0.2 , 1.0] as [NSNumber]
    
    @IBOutlet weak var GoogleMapview: GMSMapView!
    
    let latitude = 24.8607
    let longitude = 46.62362
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GoogleMapview.isMyLocationEnabled = true
        GoogleMapview.settings.myLocationButton = true
        
        setupMap()
        setUpHeatMap()
        
                }
    
    func getDummyLocations()-> [location]{
        let loctionAray : [location] = [ location(latitude: 24.8607045, longitude: 46.62362557),
                                          location(latitude: 24.8607675, longitude: 46.62362309),
                                          location(latitude: 24.86072987, longitude: 46.62362389),
                                          location(latitude: 24.8607836, longitude: 46.62362190),
                                          location(latitude: 24.8607731, longitude: 46.62362443),
                                         location(latitude: 24.72672348, longitude: 46.62362673),
                                         location(latitude: 24.72672836, longitude: 46.62362562)]
        return loctionAray }
    
    
    
    func addHeatMap(){
        var list = [GMUWeightedLatLng]()
        let locations = getDummyLocations()
        for location in locations {
            let lat = location.latitude
            let longi = location.longitude
            let coords = GMUWeightedLatLng(coordinate: CLLocationCoordinate2DMake(lat,longi), intensity: 3.0)
            list.append(coords) }
        
        heatmapLayer.weightedData = list
        
    }
    
    func setUpHeatMap(){
        heatmapLayer = GMUHeatmapTileLayer()
        addHeatMap()
        heatmapLayer.map = GoogleMapview
        
    }
    
    func setupMap(){
let cam = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude), zoom: 16.0)
        GoogleMapview.camera = cam
        
    }}

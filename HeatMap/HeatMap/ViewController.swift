//
//  ViewController.swift
//  HeatMap
//
//  Created by NosaibahMW on 09/02/1444 AH.
//

import UIKit
import GoogleMaps
import GoogleMapsUtils
import CoreLocation

class ViewController: UIViewController, GMSMapViewDelegate {
    
    private var heatMapLayer:GMUHeatmapTileLayer!

    @IBOutlet weak var googleMapsView: GMSMapView!
    
    
    //latitude and longitude of King Saud University
    var latitude = 24.72672
    var longitude = 46.62362
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleMapsView.delegate = self
        googleMapsView.isMyLocationEnabled = true
        googleMapsView.settings.myLocationButton = true
        
        heatMapLayer = GMUHeatmapTileLayer()
        addHeatMap()
        heatMapLayer.map = googleMapsView
        
        setUpMap()
    }

    
    private func getDummyLocation() -> [Location]{
        
        let locations: [Location] = [Location(latitude: 24.72672345, longitude: 46.62362754),
                                     Location(latitude: 24.72672675, longitude: 46.62362390),
                                     Location(latitude: 24.72672234, longitude: 46.62362578),
                                     Location(latitude: 24.72672987, longitude: 46.62362389),
                                     Location(latitude: 24.72672456, longitude: 46.62362295),
                                     Location(latitude: 24.72672836, longitude: 46.62362190),
                                     Location(latitude: 24.72672731, longitude: 46.62362443),
                                     Location(latitude: 24.72672124, longitude: 46.62362903),
                                     Location(latitude: 24.72672457, longitude: 46.62362278),
                                     Location(latitude: 24.72672332, longitude: 46.62362348),
                                     Location(latitude: 24.72672389, longitude: 46.62362594),
                                     Location(latitude: 24.72672784, longitude: 46.62362764),
                                     Location(latitude: 24.72672256, longitude: 46.62362784),
                                     Location(latitude: 24.72672059, longitude: 46.62362673),
                                     Location(latitude: 24.72672563, longitude: 46.62362783),
                                     Location(latitude: 24.72672957, longitude: 46.62362784),
                                     Location(latitude: 24.72672348, longitude: 46.62362673),
                                     Location(latitude: 24.72672836, longitude: 46.62362562)]
        
        return locations
    }
    
    
    private func addHeatMap(){
        
        var list = [GMUWeightedLatLng]()
        let locations = getDummyLocation()
        
        for location in locations {
            let latitude = location.latitude
            let longitude = location.longitude
            
            let coordinate = GMUWeightedLatLng(coordinate: CLLocationCoordinate2DMake(latitude, longitude), intensity: 2.0)
            
            list.append(coordinate)
        }
        
        heatMapLayer.weightedData = list
    }

    
    private func setUpMap(){
        let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 17)
        googleMapsView.camera = camera
    }
}


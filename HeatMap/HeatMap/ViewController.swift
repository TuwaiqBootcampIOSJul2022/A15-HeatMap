
import GoogleMaps
import UIKit
import GoogleMapsUtils


class ViewController: UIViewController{

    @IBOutlet weak var LocationMapView: GMSMapView!
    @IBOutlet weak var LocationAddressLabel: UILabel!
    
    var locationManger = CLLocationManager()
    var list = [GMUWeightedLatLng]()
    private var heatmapLayer: GMUHeatmapTileLayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManger.delegate = self
        locationManger.requestAlwaysAuthorization()
        locationManger.startUpdatingLocation()
        
        LocationMapView.delegate = self
        LocationMapView.isMyLocationEnabled = true
        LocationMapView.settings.myLocationButton = true
    }
}

extension ViewController: CLLocationManagerDelegate{

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLoction = locations.last{
            let longitude = lastLoction.coordinate.longitude
            let latitude = lastLoction.coordinate.latitude
            
            print("longitude: \(longitude)")
            print("latitude: \(latitude)")
            
            let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 15)
            LocationMapView.camera = camera
        }
    }
    
    func myLocation(coordinates: CLLocationCoordinate2D){
        let geocoder = GMSGeocoder() // Convert coordinates to string
        
        geocoder.reverseGeocodeCoordinate(coordinates) { response, error in
            if let address = response?.firstResult(),
               let lines = address.lines{ //array contain city, street, id address,... names
                self.LocationAddressLabel.text = lines.joined(separator: "\n")
            }
        }
    }
}

extension ViewController: GMSMapViewDelegate{
  
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let latitude = mapView.camera.target.latitude
        let longitude = mapView.camera.target.longitude
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        myLocation(coordinates: location)
    }
    
    //MARK: - Marker
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker()
        
        let markerLatitude = coordinate.latitude
        let markerLongitude = coordinate.longitude
        
        marker.position = coordinate
        marker.title = "الاحداثيات"
        marker.snippet = "\(markerLatitude)\n\(markerLongitude)"
        marker.map = mapView
        
        addHeatmap(lat: markerLatitude, lng: markerLongitude)
    }
}

//MARK: - Heat Map
extension ViewController{
    func addHeatmap(lat: CLLocationDegrees, lng: CLLocationDegrees) {
        
        heatmapLayer = GMUHeatmapTileLayer()
        heatmapLayer.radius = 80
        heatmapLayer.opacity = 0.8
        
        let coords = GMUWeightedLatLng(coordinate: CLLocationCoordinate2DMake(lat, lng), intensity: 1.0)
        list.append(coords)
        
        heatmapLayer.weightedData = list
        heatmapLayer.map = LocationMapView
        heatmapLayer.clearTileCache()
   }
}

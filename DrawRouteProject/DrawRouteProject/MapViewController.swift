//
//  ViewController.swift
//  DrawRouteProject
//
//  Created by MacOS on 20.01.2022.
//


import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        checkLocationPermission()
        addLongGestureRecognizer()
    }
    var directionArray : [MKPolyline] = []
    private var currentCoordinate: CLLocationCoordinate2D?
    private var destinationCoordinate: CLLocationCoordinate2D?
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        return locationManager
    }()

    @IBAction func showCurrentLocationTapped(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    @IBAction func alternativeRoute(_ sender: Any) {
        let polyLine = directionArray[0]
        directionArray.remove(at: 0)
        directionArray.append(polyLine)
        for overLay in directionArray{
            self.mapView.addOverlay(overLay)
        }
    }
    
    @IBAction func alternativeRoute1(_ sender: Any) {

    }
    
    @IBAction func drawRouteButtonTapped(_ sender: UIButton) {
         drawRoute()
    }
    func drawRoute()  {
        guard let currentCoordinate = currentCoordinate,
              let destinationCoordinate = destinationCoordinate else {
                  // log
                  // alert
            return
        }

        let sourcePlacemark = MKPlacemark(coordinate: currentCoordinate)
        let source = MKMapItem(placemark: sourcePlacemark)

        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate)
        let destination = MKMapItem(placemark: destinationPlacemark)

        let directionRequest = MKDirections.Request()
        directionRequest.source = source
        directionRequest.destination = destination
        directionRequest.transportType = .automobile
        directionRequest.requestsAlternateRoutes = true

        let direction = MKDirections(request: directionRequest)

        direction.calculate { response, error in
        

            guard let response = response else { return }
            
            for route in response.routes{
               self.directionArray.append(route.polyline)
               self.mapView.addOverlay(route.polyline)
               self.mapView.setVisibleMapRect(route.polyline.boundingMapRect , animated: true)
               
               
            }
            //self.directionArray[route]
            
         //   let rect = polyline.boundingMapRect
         //   let region = MKCoordinateRegion(rect)
         //   self.mapView.setRegion(region, animated: true)

            //Odev 1 navigate buttonlari ile diger route'lar gosterilmelidir.
        }
       // self.directionArray[route]
    }

    func addLongGestureRecognizer() {
        let longPressGesture = UILongPressGestureRecognizer(target: self,
                                                            action: #selector(handleLongPressGesture(_ :)))
        self.view.addGestureRecognizer(longPressGesture)
    }

    @objc func handleLongPressGesture(_ sender: UILongPressGestureRecognizer) {
        let point = sender.location(in: mapView)
        let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
        destinationCoordinate = coordinate

        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Pinned"
        mapView.addAnnotation(annotation)
        directionArray.removeAll()
    }

    func checkLocationPermission() {
        switch self.locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            locationManager.requestLocation()
        case .denied, .restricted:
            //popup gosterecegiz. go to settings butonuna basildiginda
            //kullaniciyi uygulamamizin settings sayfasina gonder
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            fatalError()
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else { return }
        currentCoordinate = coordinate
        print("latitude: \(coordinate.latitude)")
        print("longitude: \(coordinate.longitude)")
        let span = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta:
        0.01)
        let region = MKCoordinateRegion.init(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationPermission()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {

    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        if renderer.polyline == directionArray[0]{
            renderer.strokeColor = .cyan
            renderer.lineWidth = 8
            return renderer
        }else {
        renderer.strokeColor = .yellow
        renderer.lineWidth = 8
        return renderer
        }
    }
}



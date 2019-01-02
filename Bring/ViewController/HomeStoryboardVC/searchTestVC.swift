//
//  searchTestVC.swift
//  Bring
//
//  Created by 박소현 on 02/01/2019.
//  Copyright © 2019 sohyeon. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import CoreLocation
import AddressBookUI

class searchTestVC: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    
    //내가추가함
    @IBOutlet var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //내가추가함
        mapView.delegate = self
        mapSettings()
        self.view.addSubview(mapView!)
        
        
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        let subView = UIView(frame: CGRect(x: 0, y: 65.0, width: 350.0, height: 45.0))
        
        subView.addSubview((searchController?.searchBar)!)
        view.addSubview(subView)
        searchController?.searchBar.sizeToFit()
        searchController?.hidesNavigationBarDuringPresentation = false
        
        // When UISearchController presents the results view, present it in
        // this view controller, not one further up the chain.
        definesPresentationContext = true
    }

    //내가추가함
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        // 사용할때만 위치정보를 사용한다는 팝업이 발생
        //        locationManager.requestWhenInUseAuthorization()
        
        // 항상 위치정보를 사용한다는 판업이 발생
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        
        move(at: locationManager.location?.coordinate)
    }
    //내가추가함
    func mapSettings() {
        mapView.isMyLocationEnabled = true;
        mapView.settings.myLocationButton = true;
    }
    //내가추가함
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let firstLocation = locations.first else {
            return
        }
        
        //        move(at: firstLocation.coordinate)
    }
}

extension searchTestVC: GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didAutocompleteWith place: GMSPlace) {
        searchController?.isActive = false
        // Do something with the selected place.
//        print("Place name: \(place.name)")
//        print("Place address: \(place.formattedAddress)")
//        print("Place attributions: \(place.attributions)")
        print(place.coordinate)
        move(at: place.coordinate)
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didFailAutocompleteWithError error: Error){
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}


//내가추가함
extension searchTestVC {
    
    func move(at coordinate: CLLocationCoordinate2D?) {
        guard let coordinate = coordinate else {
            return
        }
        
        print("move = \(coordinate)")
        
        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 14.0)
        mapView.camera = camera
        //
        //        myMarker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        //        myMarker.title = "My Position"
        //        myMarker.snippet = "Known"
        //        myMarker.map = mapView
    }
    
}

//
//  homeVC.swift
//  Bring
//
//  Created by 박소현 on 27/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import AddressBookUI
import GooglePlaces

class homeVC: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    
    
    @IBOutlet var infoView: UIView!
    @IBOutlet var mapView: GMSMapView!
    
    var myMarker = GMSMarker()
    let locationManager = CLLocationManager()
    
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var infoImg1: UIImageView!
    @IBOutlet var infoImg2: UIImageView!
    @IBOutlet var infoImg3: UIImageView!
    
    var cafeList: [Cafe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapSettings()
        makeMarker()
        setCafeData()
         mapView.delegate = self
        self.view.addSubview(mapView!)
 
        self.view.addSubview(infoView)
        
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: 350, height: 45.0))
        
        subView.addSubview((searchController?.searchBar)!)
        view.addSubview(subView)
        searchController?.searchBar.sizeToFit()
        searchController?.hidesNavigationBarDuringPresentation = false
        
        definesPresentationContext = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        //현재 위치를 뷰에 보여줌
        move(at: locationManager.location?.coordinate)
        print(CLLocationCoordinate2D())
        print("뷰시작할때 위치")
    }
    
    func mapSettings() {
        mapView.isMyLocationEnabled = true;
        mapView.settings.myLocationButton = true;
    }
    

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let firstLocation = locations.first else {
            return
        }
//        let location: CLLocation = locations.last!
//        print(CLLocationCoordinate2D())
//        print("로케이션매니저 위치")
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool  {
        print("마커클릭...")
        
        infoLabel.text = marker.title
        infoView.isHidden = false
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        if infoView.isHidden == false {
            infoView.isHidden = true
        }
    }
    

    @IBAction func menuDetailAction(_ sender: Any) {
        
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "menudetailVC") as? menudetailVC else { return }
        dvc.cafenameData = infoLabel.text
          self.performSegue(withIdentifier: "naviSegue", sender: self)
        
        
//        navigationController?.pushViewController(dvc, animated: true)
//        print("왜안되는거지")
        
//        메뉴상세뷰에서 네브바가 추가되면서 데이터전달이 안됨
//        승수찡한테 질문할부분 ...
        }
        
    }

//검색때매새로추가함
extension homeVC: GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didAutocompleteWith place: GMSPlace) {
        searchController?.isActive = false
        
        print(place.coordinate)
        //검색결과로 지도 이동
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

extension homeVC {
    func move(at coordinate: CLLocationCoordinate2D?) {
        guard let coordinate = coordinate else {
            return
        }
        
        print("move = \(coordinate)")
        
        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 14.0)
        mapView.camera = camera
    }
    

    
    func makeMarker() {
        
        
        cafeMarker(name: "카페토니", lat: 37.497718, long: 127.037186)
        cafeMarker(name: "투썸역삼", lat: 37.502401, long: 127.038016)
        cafeMarker(name: "설탕공주", lat: 37.784358, long: -122.406893)
    }
    
    func cafeMarker(name: String, lat: Double, long: Double) {
        
        let cafemarker = GMSMarker()
        cafemarker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let markerimg = UIImage(named: "homePinCafe")
        cafemarker.icon = markerimg
        cafemarker.title = name
        cafemarker.map = mapView
        
    }
    
    func setCafeData() {
        
        
        let cafe0 = Cafe(name: "카페토니", latitude: 37.497718, longitude: 127.037186, Img: "tab_home")
        let cafe1 = Cafe(name: "투썸플레이스 역삼역점", latitude: 37.502401, longitude: 127.038016, Img: "tab_home")
        cafeList = [cafe0, cafe1]
    }
    
    
}

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
    
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    @IBOutlet var infoImg1: UIImageView!
    @IBOutlet var infoImg2: UIImageView!
    @IBOutlet var infoImg3: UIImageView!
    
    var cafeList = [CafeModel]()
    var selectedIdx: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapSettings()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = (segue.destination as! UINavigationController).topViewController as! menudetailVC
        dvc.cafenameData = infoLabel.text
        dvc.cafeIdxData = selectedIdx
    }
    
    func mapSettings() {
        mapView.isMyLocationEnabled = true;
        mapView.settings.myLocationButton = true;
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let firstLocation = locations.first else {
            return
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool  {
        _ = cafeList.map {
            if $0.cafeName == marker.title {
                self.selectedIdx = $0.cafeIdx
            }
        }
        
        infoLabel.text = marker.title
        infoView.isHidden = false
//        infoImg1.imageFromUrl(<#T##urlString: String?##String?#>, defaultImgPath: "")
        //이 부분 사진 어케 저장하는지 모르게뜸 ㅇㅅㅇ
        
        MapService2.shared.selectedStore(Idx: selectedIdx!) {
            [weak self] (data) in
            guard let `self` = self else {return}
            self.addressLabel.text = data.storeAddress
            self.numberLabel.text = data.storeNumber
            //            self.cafeMarker()
            
        }
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        if infoView.isHidden == false {
            infoView.isHidden = true
            }
    }
    
    
    @IBAction func menuDetailAction(_ sender: Any) {
        
       
        self.performSegue(withIdentifier: "naviSegue", sender: self)
        
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
        MapService.shared.mapList(lati: place.coordinate.latitude, long: place.coordinate.longitude) {
            [weak self] (data) in
            guard let `self` = self else {return}
            self.cafeList = data
            self.cafeMarker()
        }
        print(cafeList.count)
        
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
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 16.0)
        mapView.camera = camera
    }
    
    
    

    
    func cafeMarker() {
        _ = cafeList.map {
            guard let lat = $0.cafeLati else { return }
            guard let lng = $0.cafeLong else { return }
            guard let name = $0.cafeName else { return }
            guard let Idx = $0.cafeIdx else {return}
            let cafemarker = GMSMarker()
            cafemarker.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
            let markerimg = UIImage(named: "homePinCafe")
            cafemarker.icon = markerimg
            cafemarker.title = name
            cafemarker.map = mapView
            
        }
    }
    
    
}

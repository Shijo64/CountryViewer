//
//  LocationViewController.swift
//  CountryViewer
//
//  Created by Arturo Calvo on 9/24/19.
//  Copyright © 2019 Arturo Calvo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController {
    @IBOutlet weak var directionsButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    var country:CountryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var coordinates = CLLocationCoordinate2DMake((self.country?.latlng![0])!, (self.country?.latlng![1])!)
        let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000000, longitudinalMeters: 1000000)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        self.mapView.setRegion(region, animated: true)
        self.mapView.addAnnotation(annotation)
    }
    
    @IBAction func showDirections(_ sender: Any) {
        let alert = UIAlertController(title: "Abrir con", message: "", preferredStyle: .actionSheet)
        let wazeAction = UIAlertAction(title: "Waze", style: .default, handler: {
            (action) in
            if (UIApplication.shared.canOpenURL(URL(string:"waze://")!)) {  //First check Waze Mpas installed on User's phone or not.
                UIApplication.shared.openURL(URL(string: "waze://?ll=\((self.country?.latlng![0])!),\((self.country?.latlng![1])!)&navigate=yes")!)
            } else {
                    UIApplication.shared.openURL(URL(string: "http://itunes.apple.com/us/app/id323229106")!)
            }
        })
        
        let googleAction = UIAlertAction(title: "Google Maps", style: .default, handler: {
            (action) in
            if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {  //First check Google Mpas installed on User's phone or not.
                UIApplication.shared.openURL(URL(string: "comgooglemaps://?saddr=&daddr=\((self.country?.latlng![0])!),\((self.country?.latlng![1])!)&directionsmode=driving")!)
            } else {
                    print("Can't use comgooglemaps://");
             }
        })
        
        let cancelarAction = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        
        alert.addAction(wazeAction)
        alert.addAction(googleAction)
        alert.addAction(cancelarAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func dismisController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

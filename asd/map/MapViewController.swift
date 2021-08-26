//
//  MapViewController.swift
//  asd
//
//  Created by apple on 2021/8/18.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    //@IBAction func showMeWhere(_ sender: Any) {
    
    
  //  @IBOutlet weak var mapView: GMSMapView!
   // var myLocationMgr: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private let locationButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(askToOpenMap), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
  
    func setButton() {
           view.addSubview(locationButton)
           locationButton.backgroundColor = .systemBlue
           locationButton.setTitle("打開地圖", for: .normal)
           locationButton.layer.cornerRadius = 8
           locationButton.translatesAutoresizingMaskIntoConstraints = false
           locationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           locationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
           locationButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
           locationButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
       }
       @objc func askToOpenMap() {
           OpenMapDirections.present(in: self, sourceView: locationButton)
       }}



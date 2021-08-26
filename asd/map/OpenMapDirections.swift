//
//  OpenMapDirections.swift
//  asd
//
//  Created by apple on 2021/8/26.
//
//光田24.23548,120.55881

import CoreLocation
import MapKit
import UIKit

class OpenMapDirections {
    
    // If you are calling the coordinate from a Model, don't forgot to pass it in the function parenthesis.
    static func present(in viewController: UIViewController, sourceView: UIView) {
        let actionSheet = UIAlertController(title: "打開地圖", message: " 選擇想要使用的App ", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Google 地圖", style: .default, handler: { _ in
            // Pass the coordinate inside this URL
            let url = URL(string: "comgooglemaps://?daddr=24.23548,120.55881&directionsmode=driving&zoom=14&views=traffic")!
            //UIApplication.shared.open(url, options: [:], completionHandler: nil)
            if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }else {
                    let appStoreGoogleMapURL = URL(string: "itms-appps://itunes.apple.com/app/id585027354")!
                    UIApplication.shared.open(appStoreGoogleMapURL, options: [:], completionHandler: nil)
                }
        }))
        actionSheet.addAction(UIAlertAction(title: "地圖", style: .default, handler: { _ in
            // Pass the coordinate that you want here
            let coordinate = CLLocationCoordinate2DMake(24.23548,120.55881)
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
            mapItem.name = "Destination"
            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
        }))
        actionSheet.popoverPresentationController?.sourceRect = sourceView.bounds
        actionSheet.popoverPresentationController?.sourceView = sourceView
        actionSheet.addAction(UIAlertAction(title: "關閉", style: .cancel, handler: nil))
        viewController.present(actionSheet, animated: true, completion: nil)
    }
}

//
//  UIViewController+Extension.swift
//  QRCode
//
//  Created by Diep Nguyen on 4/10/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

extension UIViewController {
    
    func showSheetGetImage() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "common.Cancel".localize(), style: .cancel)
        alertController.addAction(cancelAction)
        
        let galleryAction = UIAlertAction(title: "profile.Gallery".localize(), style: .default) { [weak self] _ in
            self?.getImageFromLibrary()
        }
        alertController.addAction(galleryAction)
        
        let cameraAction = UIAlertAction(title: "profile.Camera".localize(), style: .default) { [weak self] _ in
            self?.getImageFromCamera()
        }
        alertController.addAction(cameraAction)
        
        present(alertController, animated: true)
    }
    
    func getImageFromCamera() {
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .denied:
            presentSettings(isCamera: true)
        case .restricted:
            presentSettings(isCamera: true)
        case .authorized:
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: {
                UIApplication.shared.statusBarStyle = .default
            })
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { success in
                if success {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
                    imagePicker.sourceType = .camera
                    imagePicker.allowsEditing = false
                    self.present(imagePicker, animated: true, completion: {
                        UIApplication.shared.statusBarStyle = .default
                    })
                } else {
                    print("Permission denied")
                }
            }
        }
    }
    
    func getImageFromLibrary() {
        switch PHPhotoLibrary.authorizationStatus() {
        case .denied:
            presentSettings(isCamera: false)
        case .restricted:
            presentSettings(isCamera: false)
        case .authorized:
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: {
                UIApplication.shared.statusBarStyle = .default
            })
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (success: PHAuthorizationStatus) in
                if success == .authorized {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
                    imagePicker.sourceType = .photoLibrary
                    imagePicker.allowsEditing = false
                    
                    self.present(imagePicker, animated: true, completion: {
                        UIApplication.shared.statusBarStyle = .default
                    })
                } else {
                    print("Permission denied")
                }
            }
        }
    }
    
    private func presentSettings(isCamera: Bool) {
        let message = isCamera ? "Account.CameraDenied".localize() : "Account.LibraryDenied".localize()
        let alertController = UIAlertController(title: "common.error".localize(),
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Common.Cancel".localize(), style: .default))
        alertController.addAction(UIAlertAction(title: "Account.Settings".localize(), style: .cancel) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: { _ in
                        
                    })
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        })
        
        present(alertController, animated: true)
    }
}

//
//  ViewController.swift
//  New Super Awesome Camera App
//
//  Created by Hana on 9/22/16.
//  Copyright © 2016 sarcrates. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
	
	@IBOutlet weak var pickedImaged: UIImageView!
	

	override func viewDidLoad()
	{
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
	@IBAction func camerabuttonaction(_ sender: UIButton)
	{
		if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
		{
			let imagePicker = UIImagePickerController()
			imagePicker.delegate = self
			imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
			imagePicker.allowsEditing = false
			self.present(imagePicker, animated: true, completion: nil)
		}
		
	}
	
	@IBAction func photolibraryaction(_ sender: UIButton)
	{
		if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)
		{
			let imagePicker = UIImagePickerController()
			imagePicker.delegate = self
			imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
			imagePicker.allowsEditing = true
			self.present(imagePicker, animated: true, completion: nil)
		}
		
		
	}
	
	@IBAction func saveaction(_ sender: UIButton)
	{
		let imageData = UIImageJPEGRepresentation(pickedImaged.image!, 0.6)
		let compressedJPEGImage = UIImage(data: imageData!)
		UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil)
		saveNotice()
	}
	
	@objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!)
	{
		pickedImaged.image = image
		self.dismiss(animated: true, completion: nil);
	}
	
	
	@objc func saveNotice()
	{
		let alertController = UIAlertController(title: "Image Saved!", message: "Your picture was successfully saved.", preferredStyle: .alert)
		let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alertController.addAction(defaultAction)
		present(alertController, animated: true, completion: nil)
	}

}


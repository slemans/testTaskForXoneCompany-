//
//  TextFieldDelegateExt.swift
//  ProjectForXoneCompany
//
//  Created by sleman on 01.02.22.
//

import Firebase
import UIKit

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func cooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }

    func imagePickerController(_: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        uploadImageFireStorege(photo: image) { [weak self] result in
            switch result {
            case let .success(url):
                let imgUrl = url.absoluteString
                let newImgTask = Images(title: GetDate.time, url: imgUrl)
                guard let index = self?.indexCellWherePutImages else { return }
                let newDemoStreet = self?.arrayStreet[index].ref?.child(Constants.arrayImageKey).child("\(GetDate.time)")
                newDemoStreet?.setValue(newImgTask.convertStreetDictionary())
            case let .failure(error):
                print(error)
            }
        }
    }

    func uploadImageFireStorege(photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
//       let storeRef = store.reference().child("photo").child(GetDate.time)
        let storeRef = FirebaseStorageProject.storage.reference().child("photo").child(GetDate.time)

        guard let data = photo.jpegData(compressionQuality: 0.4) else { return }
        let metaDate = StorageMetadata()
        metaDate.contentType = "image/jpeg"

        storeRef.putData(data, metadata: metaDate) { metadata, error in
            guard let _ = metadata else {
                completion(.failure(error!))
                return
            }
            storeRef.downloadURL { url, error in
                guard let url = url else {
                    completion(.failure(error!))
                    return
                }
                completion(.success(url))
            }
        }
    }
}

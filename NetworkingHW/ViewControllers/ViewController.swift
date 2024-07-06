//
//  ViewController.swift
//  NetworkingHW
//
//  Created by Evgeniy Maksimov on 05.07.2024.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    private let url = URL(string: "https://random.dog/woof.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRandomDogImage()
    }
    
    private func fetchRandomDogImage() {
        guard let url else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error")
                return
            }
            let decoder = JSONDecoder()
            
            do {
                let randomDogImage = try decoder.decode(RandomDogImage.self, from: data)
                print(randomDogImage)
            } catch {
                print(error)
            }
        }.resume()
    }
}

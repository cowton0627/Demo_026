//
//  ViewController.swift
//  Demo_026
//
//  Created by 鄭淳澧 on 2021/8/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fecthData()
        
        
        let urlStr = "https://itunes.apple.com/search?term=swift&media=music"
        if let url = URL(string: urlStr) {
        URLSession.shared.dataTask(with: url) { data, response , error in
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        if let data = data {
        do {
        let searchResponse = try decoder.decode(SearchResponse.self, from: data)
        print(searchResponse)
        } catch {
        print(error)
        }
        } else {
        // show error
        }
        }.resume()
        }

    }


    func fecthData() {
        let urlStr = "https://source.unsplash.com/random"
        
        
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { data, reponse, error in
                
                guard let data = data else { return }
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self.myImgView.image = image
                }
                
            }.resume()
        }
        
        
        
       
        
        
        
        
        
    }
    
    
}


//
//  AlbumController.swift
//  Albums
//
//  Created by Austin Cole on 1/21/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

class AlbumController {
    
    typealias CompletionHandler = (Error?) -> Void
    
    func testDecodingExampleAlbum() {
        
        let album: Album?
        
        let url = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json")
        
        do{
        let data = try Data(contentsOf: url!)
            print(data)
            let decoder = JSONDecoder()
            album = try? decoder.decode(Album.self, from: data)
            print(album)
        } catch {
            print("unable to decode.")
        }
        
        
        
        
        
        
    }
    
}

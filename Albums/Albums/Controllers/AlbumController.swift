//
//  AlbumController.swift
//  Albums
//
//  Created by Austin Cole on 1/21/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

class AlbumController {
    
    var classAlbum: Album?
    
    typealias CompletionHandler = (Error?) -> Void
    
    func testDecodingExampleAlbum() {
        
        let album: Album?
        
        let url = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json")
        do{
        let data = try Data(contentsOf: url!)
            let decoder = JSONDecoder()
            album = try? decoder.decode(Album.self, from: data)
            classAlbum = album
        } catch {
            print("unable to decode.")
        }
    }
    func testEncodingExampleAlbum() {
        let album = classAlbum
        do{
            let jsonEncoder = JSONEncoder()
            let data = try jsonEncoder.encode(album)
            print(data)
        } catch {
            print("unable to encode.")
        }
    }
    
}

//
//  Album.swift
//  Albums
//
//  Created by Austin Cole on 1/21/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

struct Album: Decodable {
    
    enum AlbumKeys: String, CodingKey {
        case artist
        case coverArt
        case genres
        case id
        case name
        case songs
        
        enum CoverArtKeys: String, CodingKey {
            case url
        }
    }
    
    let artist: String
    let coverArt: [String]
    let genres: [String]
    let id: String
    let name: String
    let songs: [Song]
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: AlbumKeys.self)
        
        artist = try container.decode(String.self, forKey: .artist)
        
        var coverArtContainer = try container.nestedUnkeyedContainer(forKey: .coverArt)
        var coverArtUrls: [String] = []
        let coverArtDescriptionContainer = try coverArtContainer.nestedContainer(keyedBy: AlbumKeys.CoverArtKeys.self)
        let coverArtUrl = try coverArtDescriptionContainer.decode(String.self, forKey: .url)
        
        coverArtUrls.append(coverArtUrl)
        coverArt = coverArtUrls
        
        
        
        genres = try container.decode([String].self, forKey: .genres)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        
        var songsContainer = try container.nestedUnkeyedContainer(forKey: .songs)
        
        var newSongs: [Song] = []
        
        while !songsContainer.isAtEnd {
        var keyedSongsContainer = try songsContainer.nestedContainer(keyedBy: Song.SongKeys.self)
            
            let durationContainer = try keyedSongsContainer.nestedContainer(keyedBy: Song.SongKeys.self, forKey: .duration)
       let duration = try durationContainer.decode(String.self, forKey: .duration)
            print(duration)
            
        let id = try keyedSongsContainer.decode(String.self, forKey: .id)
            print(id)
            
            let nameContainer = try keyedSongsContainer.nestedContainer(keyedBy: Song.SongKeys.NameKeys.self, forKey: .name)
            let name = try nameContainer.decode(String.self, forKey: .title)
            print(name)
            newSongs.append(Song(duration: duration, id: id, name: name))
        }
        songs = newSongs
    }
        
    struct Song: Decodable {
        
        enum SongKeys: String, CodingKey {
            case duration
            case id
            case name
            
            enum NameKeys: String, CodingKey {
                case title
            }
        }
        
        var duration: String
        var id: String
        var name: String
        
    }
}

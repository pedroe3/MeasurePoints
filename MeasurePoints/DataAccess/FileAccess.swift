//
//  FileAccess.swift
//  MeasurePoints
//
//  Created by Pedro Rivera on 6/17/18.
//  Copyright © 2018 sadcrow. All rights reserved.
//

import Foundation
import UIKit

class FileAccess {
    let encoder = PropertyListEncoder()
    let favoriteData = AppData.shared
    
    func saveToFavoritesFile() {
        do {
         
            let data = try encoder.encode(favoriteData.measurePointFavoriteList)
            try data.write(to: dataFilePath())
        } catch {
            print("error")
        }
    }
    
    func loadFromFavoritesFile() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path)  {
            let decoder = PropertyListDecoder()
            do {
                var items = [MeasurePoint]()
                items = try decoder.decode([MeasurePoint].self, from: data)
                for var item in items {
                    item.isFavorite = true
                    favoriteData.updateFavoriteList(with: item)
                }
            } catch {
                print("Error decoding item array!")
            }
        }
    }
}

extension FileAccess {
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Favorites.plist")
    }
}

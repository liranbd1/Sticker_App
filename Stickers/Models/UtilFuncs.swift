//
//  UtilFuncs.swift
//  Stickers
//
//  Created by Liran on 13/01/2023.
//

import Foundation

class UtilsFuncs{
    
    static func getAllStickers() -> StickersToShow{
        var keys : [CodableSticker] = []
        for (key, _) in UserDefaults.standard.dictionaryRepresentation(){
            if key.contains("_sticker") {
                keys.append(getStickerFromData(key: key))
            }
        }
        
        return StickersToShow(stickers: keys)
    }
    
  static func getStickerFromData(key:String) -> CodableSticker{
        if let data = UserDefaults.standard.data(forKey: key){
            do{
                let decoder = JSONDecoder()
                let sticker = try decoder.decode(CodableSticker.self, from: data)
                return sticker
            }
            catch{
                print("")
            }
        }
        
        return CodableSticker(sticker: Sticker.emptySelection)
    }
    
}

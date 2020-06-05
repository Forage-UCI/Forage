//
//  NetworkService.swift
//  Forage
//
//  Created by Maha Malik on 6/4/20.
//  Copyright © 2020 Forage-UCI. All rights reserved.
//

import Foundation
import Moya

private let apiKey = "Hor-0FqCACTvN-CmJa57WB-HceNzUH2ZEnPIPrzXBcCczHGxxqBBrRGdijkvAJvh27X8SphBm2Pn-_AeXyQkt3jrg-vFFSGsORgpO71WEvRO5OlPBxa3Aw4WBObZXnYx"

enum YelpService{
    enum BusinessesProvider: TargetType {
        case search(lat: Double, long:Double)
        
        var baseURL: URL{
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }
        
        var path: String{
            switch self {
                case .search:
                    return "/search"
            }
        }
        
        var method: Moya.Method{
            return .get
        }
        
        var sampleData: Data{
            return Data()
        }
        var task: Task{
            switch self {
                case let .search(lat, long):
                    return .requestParameters(parameters: ["latitude": lat, "longitude": long, "limit": 10], encoding: URLEncoding.queryString)
            }
        }
        
        var headers: [String : String]?{
            return ["Authorization": "Bearer \(apiKey)"]
        }
        
    }
}


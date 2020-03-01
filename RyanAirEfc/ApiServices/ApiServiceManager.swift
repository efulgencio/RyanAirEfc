//
//  ApiServices.swift
//  RyanAirEfc
//
//  Created by eduardo fulgencio on 18/02/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiServiceManager: NSObject {
  
  var params: ParamsAvailibility?
    
  static let sharedService = ApiServiceManager()
  
  typealias ApiServiceCompletionBlock = (_ data: Data?,_ error: AppErrors?)->Void
  typealias ApiServiceCompletionBlockAlamofire = (_ jsonResult: JSON?,_ error: AppErrors?)->Void
    
    
    /// Call the URL for get the list of aeroports
    /// - Parameter completion: return the data with the information and AppErrors if process
      func requestAPI(completion: @escaping ApiServiceCompletionBlock) {
        
            if let urlComponents = URLComponents(string: APIClient.shared.urlStations) {
//               urlComponents.query = ""
               guard let url = urlComponents.url else { return }
                
               var request = URLRequest(url: url)
               request.httpMethod = "GET"
               request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
                
               let config = URLSessionConfiguration.default
               let session = URLSession(configuration: config)
                
               let task = session.dataTask(with: request) { (data, response, error) in
                if error != nil { completion(nil,AppErrors.error_code1) }
                    
                    if let data = data as Data? {
                        completion(data, nil)
                    } else {
                        completion(nil, .error_code1)
                    }
                }
               task.resume()
            }
      }
    
    
    /// Call the URL for get the destination with llist timetable
    /// - Parameter completion: return the data with the information and AppErrors if process
    func requestAPIAvailability(completion: @escaping ApiServiceCompletionBlock) {
        
        if var urlComponents = URLComponents(string: APIClient.shared.getAvailability(params: ApiServiceManager.sharedService.params!) ) {
           urlComponents.query = ""
           guard let url = urlComponents.url else {
                    return
            }
            
           var request = URLRequest(url: url)
           request.httpMethod = "GET"
           request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
            
           let config = URLSessionConfiguration.default
           let session = URLSession(configuration: config)
            
           let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil { completion(nil,AppErrors.error_code1) }
                
                if let data = data as Data? {
                     // let responseString = String(data: data, encoding: String.Encoding.utf8)
                    completion(data, nil)
                } else {
                    completion(nil, nil)
                }
            }
           task.resume()
        }
    }
    
}

extension ApiServiceManager {
    
    // Alamofire version
    func getStationsAlamofire(completion: @escaping ApiServiceCompletionBlockAlamofire) {
        
        guard let url = URL(string: APIClient.shared.urlStations) else {
          return
        }
        
       // let params : [String : String] = ["lat" : "1.0", "lon" : "1.0", "appid" : "APP_ID"]
        
                  
        Alamofire.request(url, method: .get, parameters: nil).responseJSON {
            response in
            if response.result.isSuccess {
                let resultJSON : JSON = JSON(response.result.value!)
                print(resultJSON)
                completion(resultJSON,nil)
            }
            else {
                print("Error \(String(describing: response.result.error))")
                completion(nil,.error_code1)
            }
        }
    }
    
    
    func requestAPIAvailabilityAlamofire(completion: @escaping ApiServiceCompletionBlockAlamofire) {

        guard let url = URL(string: APIClient.shared.getAvailability(params: ParamsAvailibility())) else {
          return
        }
          
        Alamofire.request(url, method: .get, parameters: nil).responseJSON {
            response in
            if response.result.isSuccess {
                let resultJSON : JSON = JSON(response.result.value!)
                print(resultJSON)
                completion(resultJSON,nil)
            }
            else {
                print("Error \(String(describing: response.result.error))")
                completion(nil,.error_code1)
            }
        }
       
        
    }
    
}

# RyanAirEfc

- Apply VIPER to the project.

- Create component : **class PassengerView : UIView** 
> Use of enum for identify the content of PassengerView
 
```
enum TypePassenger {
    case adult
    case teen
    case child
    
    var descTypePassenger: String {
        switch self {
            case .adult: return "Adult"
            case .teen: return "Teen"
            case .child: return "Child"
        }
    }
}
```
  
- Groups for organizer project
- Constants for easy read code
```
 var typePassenger: TypePassenger = .adult {
        didSet {
            switch typePassenger {
                case .adult:
                    limitQuantity = LIMIT_PASSENGER_ADULT
                    minimQuantity = MINUS_PASSENGER_ADULT
```
- Comment methods
```
    /// Find  the code content in an arrray with the string received
    /// - Parameters:
    ///   - content: array with content
    ///   - valueToFind: value to find
    func findByCode(content: Stations, valueToFind: String) -> [Station]? {
        
        let arrResult = content.airports.filter {
            $0.code.uppercased().contains(valueToFind.uppercased())
        }
        
        return arrResult
    }
```
- Always I use Alamofire, **but at this project I want to change and use URLSession
```
    typealias ApiServiceCompletionBlock = (_ data: Data?,_ error: AppErrors?)->Void
    
    /// Call the URL for get the list of aeroports
    /// - Parameter completion: return the data with the information and AppErrors if process
      func requestAPI(completion: @escaping ApiServiceCompletionBlock) {
        
            if var urlComponents = URLComponents(string: APIClient.shared.urlStations) {
               urlComponents.query = ""
               guard let url = urlComponents.url else { return }
                
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
                        completion(nil, .error_code1)
                    }
                }
               task.resume()
            }
      }

- Use of Codable for convert data to entity

```
struct Stations: Codable {
    
    var airports: [Station]
    
    enum CodingKeys: String, CodingKey {
      case stations
    }
```

    let stationObject: Stations = try JSONDecoder().decode(Stations.self, from: data)




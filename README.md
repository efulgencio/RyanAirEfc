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





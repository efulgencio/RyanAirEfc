# RyanAirEfc

- Apply VIPER to the project.

- Create component : **class PassengerView : UIView** 
> Use of enum for identify the content of PassengerView

  - 
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




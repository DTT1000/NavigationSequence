# NavigationSequence  

**NavigationSequence** is a SwiftUI implementation that provides a structured, step-based navigation system with built-in validation.

https://github.com/user-attachments/assets/125f34b1-528a-4eb2-a7a7-0ea843df996b

## Features  
✅ Step-based navigation flow  
✅ Built-in validation and error handling  
✅ Asynchronous field validation support   
✅ Expandable

## Usage  
### Defining Navigation Steps  
Create an `enum` that conforms to `NavigableStep` to define the steps in your navigation flow:  

```swift
enum SetupDevicePage: Int, NavigableStep {
    case location = 0
    case siri = 1
    case automaticUpdates = 2
    
    var id: Int { rawValue }
}
```

### Implementing a Navigation Sequence  
Conform a class to `NavigableSequence` to manage the flow:  

```swift
final class SetupDeviceSequence: NavigableSequence {
    var steps: [NavigationStep] = SetupDevicePage.allCases.map { NavigationStep($0) }
}
```

### Displaying the Navigation Flow  
Use `NavigationSequenceView` to display and manage navigation in SwiftUI:  

```swift
NavigationSequenceView(viewModel: SetupDeviceSequence())
```

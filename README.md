# CalendarView

[![SPM Compatible](https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager)
![Platforms: iOS](https://img.shields.io/badge/platforms-iOS-brightgreen.svg?style=flat)

`CalendarView` component enable show all days of the month in the grid and select a specific date. It is 100% in SwiftUI.

### TODO list
- [ ] Enable set colors
- [ ] Add icons for previous/next buttons

### Installation

As a Swift Package

`CalendarView` is distributed via SPM. You can use it as a framework in your iOS project. In your `Package.swift` add a new package dependency:

```swift
.package(
    url: "https://github.com/jantimar/CalendarView",
    from: "0.1.0"
)
```

### Usage

`CalendarView` required to initialize `CalendarViewModel`, you can initialize it with current date, heiglighted days, and selected date, or with default values.

```swift
let viewModel = CalendarViewModel(
                    today: Date(),
                    heighlighted: [Date()],
                    selectedDate: Date()
                )
```

```swift
let viewModel = CalendarViewModel()
```

To observer `selectedDate`, you can use `Combine` freamwork:

```swift
viewModel.$selectedDate
    .sink { selectedDate in
        ...
    }
```

Now with your `viewModel` you can initialize `CalendarView`

```swift
CalendarView(viewModel: viewModel)
``` 

![light](/assets/calendarView-light.png)

### Days

![default](/assets/default.png)
Default

![heighlighted](/assets/heighlighted.png)
Heighlighted

![selected](/assets/selected.png)
Selected

![current](/assets/current.png)
Current

![disabled](/assets/disabled.png)
Disabled

## License and Credits

**CalendarView** is released under the MIT license. See [LICENSE](/LICENSE) for details.

Created by [Jan Timar](https://github.com/jantimar).

# ClearScoreTest

## The Task
![Simulator Screen Shot - iPhone 13 Pro Max - 2022-05-15 at 12 27 54](https://user-images.githubusercontent.com/1189000/168473559-cb98032f-5d1a-4f41-8b4e-fb6d3cb005c2.png)
![Simulator Screen Shot - iPhone 13 Pro Max - 2022-05-15 at 12 27 49](https://user-images.githubusercontent.com/1189000/168473567-41c8d91c-ece8-460b-8bd3-442767153925.png)
![Simulator Screen Shot - iPhone 13 Pro Max - 2022-05-15 at 12 27 34](https://user-images.githubusercontent.com/1189000/168473568-f71a2a3b-1695-4ebf-a23d-160094cb0898.png)
![Simulator Screen Shot - iPhone SE (2nd generation) - 2022-05-15 at 12 26 46](https://user-images.githubusercontent.com/1189000/168473569-fa59c737-6836-4f94-b514-7c1dcdeb4b10.png)
![Simulator Screen Shot - iPhone SE (2nd generation) - 2022-05-15 at 12 26 43](https://user-images.githubusercontent.com/1189000/168473571-a0af9f9a-37d8-4813-826e-b5236eee5104.png)
![Simulator Screen Shot - iPad Pro (11-inch) (3rd generation) - 2022-05-15 at 12 26 01](https://user-images.githubusercontent.com/1189000/168473573-5cce408b-8337-44ae-bb19-164226a0ed2d.png)
![Simulator Screen Shot - iPad Pro (11-inch) (3rd generation) - 2022-05-15 at 12 25 56](https://user-images.githubusercontent.com/1189000/168473574-7ca026da-e75c-47f9-8282-a710d3f30640.png)

The task was to create an iOS that made network requests and display a credit score to the user.

* * * * *


## Architecture

The project adopts the MVVM-C pattern.

I've structured the project in a way that would allow you to easily move items to their modules. 
Each module should also have a demo project unless it's a SupportModule.

Ideally, the modules would be created using Cocoa Development Pods. Enabling one to keep to a mono-repo style. This has multiple benefits including not having
to version the pods!

Folders that should be modules are:-

Main - Yup even this could be a module :D
FeatureSupport
UIComponents

Once modularised, I would also like to add a TestSupportModule which would house some of the mocks found in Unit and UITests. This would allow each of the modules
to consume these.

### P.S I'm a HUGE fan of Modular development!

### Note
You will notice I have two UIImage+Extension files. Normally this wouldn't be an issue if adopting the above. The reason for this is that this
UIComponents will have a different asset catalog to the main project. This could be addressed by using namespacing possibly?

I'm also injecting a concretion into both the ReportVC & DashboardVC (DashboardViewModel), ideally, this should be an abstraction. 
Given more time I would have created a CreditReportDataProvider which should be housed in the ReportVM and DashboardVM. 
I've probably broken the D in SOLID by doing this and wouldn't expect a PR approval.

The CircularProgressView was ripped from a RayWenderlich tutorial. Although relatively simple to build, I did this to save on development time.
Given more time this should be built out to support different sizes rather than hardcoded values.

## Error Handling
The app currently has a retry button on the dashboard if the API call fails. However, given more time id expect a Toast or other notification prompt providing more
information to the user / qa / developer. 

## UI & Unit Tests
UITests currently support Offline and Online modes.
UITests are only in English. If I added another language and UITest to match I would expect them to fail. I'm not confident that the localization is working.

### Code Coverage
UITest - 91.1%
UnitTests - 61%
More work on Unit tests to try and hit the 80% threshold

## Dependency Management
I'm a big fan of Cocoapods which would be my preference. This project currently has everything in Native and no DM is required in the interest of KISS.
In a production environment, I would personally add SwiftGen, SwiftLint, and possibly SwiftFormat.

## Accessibility
No work has been done to support Accessibility and would be high on the todo list.


### Other
The App currently supports iPhone and iPad. This was done to enable me to quickly see the UI on multiple devices. Personally would turn off iPad and
build a separate project to take advantage of the iPads OS and other advanced features.

The app supports ALL rotations and appears to function well. However, it is designed for portrait and more work would be required to move UIElements.

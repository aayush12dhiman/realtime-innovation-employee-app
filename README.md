# realtime_innovation_employee_app

A Flutter project which is created as a part of Assignment for the RealTime Innovation.

## Important items regarding this project

### Flutter and dart details

This project is created by Aayush Dhiman, on Android Studio. Flutter Version used is 3.29.2 Dart
Version is 3.7.2 Complete testing is done using physical Pixel 3a XL Android device.

### Features

As required the features of this code are to handle the employees. Using this app code, one can add
an employee (mentioning name, role, start and end dates). Edit and delete employees is also part of
this app code. Fetching all employees, grouping them based on the current and previous employees is
also part of this code. While deleting the employee, the app asks for a confirmation and after
deleting the employee data, app gives an Undo option as well, up to 3 seconds.

Error handling is also taken care during development of this code. A fully custom date picker, to
match the look and feel with the figma is created for this application.

### Architecture & state management

Regarding the architecture of the app, clean architecture is used (3 main layers are made:
presentation, domain, data). And state management is done using Bloc

Here is the hierarchy from UI to database:
UI Elements >> Bloc >> UseCases >> Repository >> EmployeeDataSource

Communication between layers is done using abstracted classes and entity models.

### pubspec.yaml

In pubspec.yaml, following packages are used

[hive: for local database]
[bloc: for state management]
[get it: for service locators]
[equitable: for models equality]
[screen_util: for making UI elements adjusted to different screens, responsive scaling]
[localization: for enabling multiple languages support ]
[intl: for date formatting]
[gap: for spaces on UI]
[grouped_list: for grouped list view]
[freezed: for model generation]
[dartz: for error handling]

### Custom Date picker

This app code includes a CustomDatePicker designed exactly as the Figma. It provides quick selection
options like Today, Next Monday, Next Tuesday, and After One Week. The picker provides smooth
navigation between months using arrow buttons while maintaining min/max date constraints.

### Future Improvements

Obviously, this app code has a lot of scope for improvement, like search feature can be provided on
the employees list screen. More importantly, in the CustomDatePicker, the app can have carousel kind
of views, to enhance the usability further. That will make the app visually appealing as well.
# About The Project
This is an E-Commerce Application written with Flutter framework. It includes the basic features that any E-Commerce app typically has,
such as auth system searching products, filtering search, basket menagement and more. I also want to mention that this was a really fun project to code. 
I learned much better ways to utilize Flutter's capabilities and also improved my knowledge of Dart, of course. I hope my opens-ource project will also be educational for you. 
The app uses an API that i developed [link](https://github.com/BerkCicekler/e-commerce-audio-api).

## Thought about UI
Generally i followed this [UIKit](https://www.figma.com/community/file/900960330469075490/e-commerce-ui-kit-v1-1) and sending my thanks to <b>Harum Shidiqi</b> for creating such a high-quality UIKit. However, due to the kit's limited theme data (e.g., radiuses, font styles, etc.), I had to write a lot of boilerplate code for styling texts and other widgets.  
This project's UI code could definitely have been written more efficiently if there had been proper documentation for all the font and styling variables. And yes, this is my excuse 🫣.

## Features
Authentication System<br>
Google(OAuth) SignIn<br>
Remember Me<br>
Product searching and filtering<br>
Basket management

## Dependencies
- State Management
  * [flutter_bloc](https://pub.dev/packages/flutter_bloc)
  * [bloc_concurrency](https://pub.dev/packages/bloc_concurrency)
  * [provider](https://pub.dev/packages/provider)
- Network
  * [dio](https://pub.dev/packages/dio)
- navigation
  * [auto_route](https://pub.dev/packages/auto_route)
- localization
  * [easy_localization](https://pub.dev/packages/easy_localization)
- cache
  * [isar](https://pub.dev/packages/isar)
  * [isar_flutter_libs](https://pub.dev/packages/isar_flutter_libs)
  * [path_provider](https://pub.dev/packages/path_provider)
- UI
  * [flutter_svg](https://pub.dev/packages/flutter_svg)
  * [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar)
- Utils
  * [equatable](https://pub.dev/packages/equatable)
  * [google_sign_in](https://pub.dev/packages/google_sign_in)
  * [json_annotation](https://pub.dev/packages/json_annotation)
  * [logger](https://pub.dev/packages/logger)
  * [get_it](https://pub.dev/packages/get_it)
  * [freezed_annotation](https://pub.dev/packages/freezed_annotation)
- dev_dependencies
  * [build_runner](https://pub.dev/packages/build_runner)
  * [auto_route_generator](https://pub.dev/packages/auto_route_generator)
  * [json_serializable](https://pub.dev/packages/json_serializable)
  * [isar_generator](https://pub.dev/packages/isar_generator)
  * [freezed](https://pub.dev/packages/freezed)
  * [very_good_analysis](https://pub.dev/packages/very_good_analysis)

# Images
<img src="https://github.com/user-attachments/assets/50224053-d331-4254-ae56-256600f22a5e" width="250px" alt="">
<img src="https://github.com/user-attachments/assets/efb675cc-d0e0-4746-91d2-66ab9fa88af1" width="250px" alt="">
<img src="https://github.com/user-attachments/assets/a95b5675-3911-41c0-a64f-3c8baffef334" width="250px" alt="">
<img src="https://github.com/user-attachments/assets/6be08e3b-9fe8-4f56-8aed-b3df37d17512" width="250px" alt="">
<img src="https://github.com/user-attachments/assets/55774648-03e7-4318-a11e-d42d93e8f7a3" width="250px" alt="">
<img src="https://github.com/user-attachments/assets/e8a83ccd-38e1-4e23-9bfc-90a2fa36de83" width="250px" alt="">
<img src="https://github.com/user-attachments/assets/57901020-7a0d-4aeb-a262-532361f12e53" width="250px" alt="">
<img src="https://github.com/user-attachments/assets/47a89357-d713-4c62-b512-16c3c02c7245" width="250px" alt="">
<img src="https://github.com/user-attachments/assets/194f9ce3-9996-49a9-895e-10d53a95e9a7" width="250px" alt="">

## How Do I Use
Firstly as the api is localhosted you have to restapi running on your local device<br>
The setup tutorial can be found in the bottom [E-Commerce-API](https://github.com/BerkCicekler/e-commerce-audio-api)<br>
after setting up the api just clone the project to your device and use these commands
```
flutter pub get
dart run build_runner build
sh scripts/language.sh
```
Voilà! You are ready to go


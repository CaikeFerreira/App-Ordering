# App Ordering - Front-End
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/CaikeFerreira/App-Ordering/blob/main/LICENSE) 

# About the Project
This project is the Front-End of an ordering app developed in Flutter. It allows customers to view the product list, add items to the cart, place orders directly with the supplier, and view their order history. The app consumes a REST API built with .NET Core, available in a separate repository.

## Features
- Product List: View the available products in the catalog.
- Shopping Cart: Add items to the cart to make ordering easier.
- Order Placement: Send your orders directly to the supplier.
- Order History: Track the orders you have already placed.

## Technologies Used
- Framework: Flutter
- Language: Dart
- Architecture: MVVM
- State Management: Bloc

## Layout
![Home](https://github.com/CaikeFerreira/App-Ordering/blob/main/assets/images/Layout%20Home.png)
![Products](https://github.com/CaikeFerreira/App-Ordering/blob/main/assets/images/Layout%20Product%20List.png)

![Cart](https://github.com/CaikeFerreira/App-Ordering/blob/main/assets/images/Layout%20Cart.png)
![Orders](https://github.com/CaikeFerreira/App-Ordering/blob/main/assets/images/Layout%20Order.png)

## Project Architecture
The project follows the MVVM (Model-View-ViewModel) architecture, ensuring a clear separation between business logic, user interface, and data management, facilitating the app’s maintenance and scalability.

## State Management
We use Bloc as the state management solution. Bloc allows us to keep business logic out of the interface layer, providing a predictable and organized data flow within the app.

## API Integration - [Repository](https://github.com/CaikeFerreira/App-Ordering-API)
The app consumes a REST API built in .NET Core, responsible for providing product data, managing orders, and making the order history available.


# How to Run the Project

## Requirements
- Flutter SDK >= 2.0
- Dart >= 2.12

```bash
# Clone the repository
git clone https://github.com/CaikeFerreira/App-Ordering.git

# Install the project dependencies
flutter pub get

# Run the application
flutter run
```

## Contributions
Contributions are always welcome! Feel free to open issues or submit pull requests.

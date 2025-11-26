# Weather App

A beautiful and responsive weather application built with Flutter that provides real-time weather data, hourly forecasts, and a 7-day forecast for any city.

## Screenshots

*(Here you can add screenshots of your application)*

| Home Screen                                     | Search Modal                                  | 7-Day Forecast                                  |
| ----------------------------------------------- | --------------------------------------------- | ----------------------------------------------- |
| <img src="path/to/home_screen.png" width="250">  | <img src="path/to/search.png" width="250">    | <img src="path/to/forecast.png" width="250">    |

## Features

- **Real-time Weather:** Get the current temperature, weather condition, wind speed, humidity, and cloud cover.
- **Hourly Forecast:** View a scrollable hourly forecast for the current day.
- **7-Day Forecast:** See a detailed weather forecast for the next 7 days.
- **City Search:** Search for any city worldwide to get its weather data.
- **Dynamic UI:** The user interface displays icons that correspond to the current weather conditions.
- **Responsive Design:** The layout is designed to be responsive and adapt to various screen sizes.

## Technologies Used

- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** [Dart](https://dart.dev/)
- **State Management:** [GetX](https://pub.dev/packages/get)
- **API Client:** [http](https://pub.dev/packages/http)
- **Date Formatting:** [intl](https://pub.dev/packages/intl)
- **UI Components:** [modal_bottom_sheet](https://pub.dev/packages/modal_bottom_sheet)

## API Used

This project relies on the [WeatherAPI](https://www.weatherapi.com/) to fetch all weather-related data. You will need to get your own free API key to run the application.

## Setup and Installation

Follow these steps to get the project up and running on your local machine.

1.  **Clone the Repository**
    ```sh
    git clone https://github.com/your-username/weather-app.git
    cd weather-app
    ```

2.  **Get an API Key**
    - Go to [WeatherAPI.com](https://www.weatherapi.com/) and sign up for a free API key.
    - Open the file `lib/controllers/home_controller.dart`.
    - Replace the placeholder API key with your own key:
      ```dart
      static String API_KEY = "YOUR_API_KEY_HERE";
      ```

3.  **Install Dependencies**
    ```sh
    flutter pub get
    ```

4.  **Run the Application**
    ```sh
    flutter run
    ```

---
*This README was generated with assistance from an AI tool.*

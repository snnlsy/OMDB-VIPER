# OMDB Project

This repository is a modular implementation of a movie search application using the VIPER architecture. Below are the details of the code organization, its usage, and how to set it up.

## Project Structure

The project is organized into the following key modules and components:

### 1. Modules

#### **Movie List Module**
This module handles displaying and searching for movies.
- **Builder:** Handles the creation and wiring of the Movie List module.
- **Interactor:** Fetches data from the repository.
- **Presenter:** Coordinates between the view and the interactor.
- **View:** Displays data to the user and handles user input.
- **Router:** Manages navigation to other screens.

#### **Movie Detail Module**
This module handles displaying the details of a selected movie.
- Similar structure as the Movie List Module.

### 2. Dependency Injection
The project uses a `DependencyContainer` for managing dependencies across the application. It supports `singleton` and `transient` lifetimes.

### 3. Utilities
Helper utilities include:
- **Extensions:** Convenience methods for `UIView`, `UITableView`, etc.
- **Design Kit:** Centralized styling constants like padding and fonts.
- **Loading View:** A reusable loading indicator.
- **Error Handling:** Utilities for displaying error alerts.

### 4. Networking
The project uses `SUNetworking` for network requests and response handling. This layer is abstracted into the `DataService` and `Repository`.

### 5. UICollectionViewDiffableDataSource
The project leverages `UICollectionViewDiffableDataSource` to manage and update the collection view data seamlessly. This ensures smoother UI updates and less boilerplate code for managing sections and rows.

### 6. Localization
The application supports localization, making it easy to adapt the user interface for multiple languages. All user-facing text is managed through localized strings files. Additionally, `LocalizationKey` extensions are used to define strongly-typed keys for localized strings:

### 7. Tests
Unit and snapshot tests are implemented for key modules:
- **Unit Tests:** Validate interactor, presenter, and router logic.
- **Snapshot Tests:** Ensure views render correctly across different configurations.

## Setup

### Prerequisites
- Xcode 15 or later
- Swift 5.5 or later

### Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/snnlsy/OMDB-VIPER.git
    cd OMDB
    ```
2. Open the project in Xcode:
    ```bash
    open OMDB.xcodeproj
    ```
3. Build the project:
    - Select a simulator (e.g., iPhone 14 Pro).
    - Press `Cmd + B` to build.

### Running Tests
Run tests using Xcode:
- `Cmd + U` to execute all tests.
- Snapshot tests require a simulator to generate or compare snapshots.

## Usage

### Movie Search
1. Launch the app.
2. Use the search bar to enter a movie title or keyword.
3. Results appear in both table view and collection view layouts.

### Movie Details
1. Tap on a movie in the table or collection view.
2. The app navigates to the detail screen displaying the movie's title, year, and poster.

## Code Highlights

### VIPER Architecture
This project follows the VIPER design pattern, which provides clear separation of concerns:
- **View:** Displays data and captures user input.
- **Interactor:** Business logic and data handling.
- **Presenter:** Mediator between view and interactor.
- **Entity:** Data model.
- **Router:** Navigation and module initialization.

### Dependency Injection
`DependencyContainer` allows for easy management of dependencies:
```swift
DependencyContainer.shared.register(NetworkServicing.self, lifetime: .singleton) {
    NetworkService()
}
```

### Localization
The application supports multiple languages through the use of localized string files. This ensures a seamless user experience for users across different regions. Strongly-typed keys defined in `LocalizationKey` extensions are used for better type safety and maintainability:
```swift
extension LocalizationKey {
    static let movieListTitle: LocalizationKey = "movieList.title"
}
```

### Error Handling
Error alerts are standardized:
```swift
router.showError(description: "Network Error") {
    // Retry logic
}
```

### Tests
Mock classes and expectations validate behavior:
```swift
func test_retrieveMovieList_informsOutputOnSuccess() {
    let expectation = XCTestExpectation(description: "Output should be informed with success response")
    output.didRetrieveMovieListExpectation = expectation

    repository.response = .success(expectedResponse)
    sut.retrieveMovieList(query: "TestQuery", page: 1, movieListType: .tableView)

    wait(for: [expectation], timeout: 0.5)
}
```

## Future Improvements
- Transition from callback-based patterns to async/await for cleaner and more modern concurrency handling.
- Implement consistent error handling across modules with user-friendly messages and robust logging mechanisms.
- Replace the Timer-based search bar debounce logic with a Combine or Swift concurrency-based implementation.

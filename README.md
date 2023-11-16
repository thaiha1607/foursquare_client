# foursquare_client

Specialized Projects - Foursquare Client

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)

### Build

```sh
flutter pub get
dart run build_runner build lib/ --delete-conflicting-outputs
flutter run
```

### Development

```sh
flutter pub get
dart run build_runner watch lib/ --delete-conflicting-outputs
```

## Notes

- We use `build_runner` to generate the code. Therefore, we need to run `dart run build_runner build` or `dart run build_runner watch` to generate the code before building the app.
- If you use VSCode, we have a `tasks.json` file that will run `build_runner` for you. You can use `Ctrl+Shift+P` > `Run Task` > `buid-runner (Flutter): Watch` to run `build_runner` in watch mode.

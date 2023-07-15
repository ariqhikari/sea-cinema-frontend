## About SEA CINEMA

SEA CINEMA is a mobile application (Android) that helps people to buy movie tickets online through their respective cellphones.

## Table of contents

- [Demo](#demo)
- [Features](#features)
- [Technology](#technology)
- [Installation](#installation)
- [License](#license)

## Demo

You can install the Demo [here](https://github.com/ariqhikari/sea-cinema-frontend/blob/main/seacinema.apk).

## Features

- Auth
- Now Playing Movies
- Select Showtime
- E-Wallet (for ticket transaction)

## Technology

- [Dart](https://dart.dev/)
- [Flutter](https://flutter.dev/)
- [GetX](https://pub.dev/packages/get/)

## Installation

Clone the repo:

```shell
git clone https://github.com/ariqhikari/sea-cinema-frontend.git
cd flutix
```

If you want to use the local backend, clone the repo [SEA CINEMA Backend](https://github.com/ariqhikari/sea-cinema-backend)

And modify the baseUrl in **lib/app/services.dart**

```shell
String baseURL = 'http://10.0.2.2:8000';
```

After that, run your application:

```shell
flutter packages get
flutter run
```

## License

The project is under the [MIT license](https://github.com/ariqhikari/sea-cinema-frontend/blob/main/LICENSE).

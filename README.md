# flutter_storage_provider
![logo](https://flutter.dev/assets/flutter-lockup-c13da9c9303e26b8d5fc208d2a1fa20c1ef47eb021ecadf27046dea04c0cebf6.png)

Simple universal storage provider for many types of storage for Flutter & Flutter Web.

## About

This library is for storage provider for Flutter and Flutter Web.
It's able to get, store and delete JSON (Map) into the storage.

## Types

| Storage Type             | Description                                          | Import                                                                            |
|--------------------------|------------------------------------------------------|-----------------------------------------------------------------------------------|
| StorageNative            | Storage for native apps based on Sembast.            | ``import 'package:flutter_storage_provider/src/storage_native.dart';``            |
| StorageWeb               | Storage for web based on LocalStorage.               | ``import 'package:flutter_storage_provider/src/storage_web.dart';``               |
| StorageWebIndexedDB      | Storage for web based on IndexedDB.                  | ``import 'package:flutter_storage_provider/src/storage_web_indexeddb.dart';``     |
| StorageSharedPreferences | Storage for native & web based on SharedPreferences. | ``import 'package:flutter_storage_provider/src/storage_sharedpreferences.dart';`` |

## Usage

A simple usage example:

```dart
import 'package:flutter_storage_provider/flutter_storage_provider.dart';

main() {
  var storageweb = new StorageWeb();
  storageweb.get('test'); // Returns Map<String, dynamic>
}
```

## License

Everything is licensed under [BSD-3-Clause](./LICENSE), so you are free to use it.

## Creator / Developer

Design & Code was completely made by [Tristan Marsell](https://github.com/PDesire).

For any questions, you can ask on this repo by opening a new issue or otherwise ask the creator.

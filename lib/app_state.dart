import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _myCart = (await secureStorage.getStringList('ff_myCart'))?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _myCart;
    });
    await _safeInitAsync(() async {
      _ProductList =
          (await secureStorage.getStringList('ff_ProductList'))?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _ProductList;
    });
    await _safeInitAsync(() async {
      _myOrder = (await secureStorage.getStringList('ff_myOrder'))?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _myOrder;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<dynamic> _myCart = [];
  List<dynamic> get myCart => _myCart;
  set myCart(List<dynamic> _value) {
    _myCart = _value;
    secureStorage.setStringList(
        'ff_myCart', _value.map((x) => jsonEncode(x)).toList());
  }

  void deleteMyCart() {
    secureStorage.delete(key: 'ff_myCart');
  }

  void addToMyCart(dynamic _value) {
    _myCart.add(_value);
    secureStorage.setStringList(
        'ff_myCart', _myCart.map((x) => jsonEncode(x)).toList());
  }

  void removeFromMyCart(dynamic _value) {
    _myCart.remove(_value);
    secureStorage.setStringList(
        'ff_myCart', _myCart.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromMyCart(int _index) {
    _myCart.removeAt(_index);
    secureStorage.setStringList(
        'ff_myCart', _myCart.map((x) => jsonEncode(x)).toList());
  }

  void updateMyCartAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _myCart[_index] = updateFn(_myCart[_index]);
    secureStorage.setStringList(
        'ff_myCart', _myCart.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _ProductList = [
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food1\",\"imageUrl\":\"https://images.pexels.com/photos/6287539/pexels-photo-6287539.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":1,\"foodName\":\"Spaghetti Bolognese\",\"category\":\"Italian\",\"description\":\"Classic Italian dish featuring pasta with a rich and flavorful Bolognese sauce.\",\"price\":13.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food2\",\"imageUrl\":\"https://images.pexels.com/photos/12481161/pexels-photo-12481161.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":2,\"foodName\":\"Pad Thai\",\"category\":\"Thai\",\"description\":\"A popular Thai stir-fried noodle dish made with rice noodles, shrimp, tofu, peanuts, and tamarind sauce.\",\"price\":12.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food3\",\"imageUrl\":\"https://images.pexels.com/photos/2098085/pexels-photo-2098085.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":3,\"foodName\":\"Sushi\",\"category\":\"Japanese\",\"description\":\"Japanese delicacy consisting of vinegared rice topped with various ingredients, such as raw fish or seafood.\",\"price\":20.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food4\",\"imageUrl\":\"https://images.pexels.com/photos/7613568/pexels-photo-7613568.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":4,\"foodName\":\"Tacos al Pastor\",\"category\":\"Mexican\",\"description\":\"Authentic Mexican street food tacos filled with marinated pork, pineapple, and flavorful spices.\",\"price\":60.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food5\",\"imageUrl\":\"https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":5,\"foodName\":\"Burger\",\"category\":\"American\",\"description\":\"Classic American sandwich consisting of a grilled beef patty, cheese, vegetables, and condiments, served in a bun.\",\"price\":70.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food6\",\"imageUrl\":\"https://images.pexels.com/photos/3928854/pexels-photo-3928854.png?auto=compress&cs=tinysrgb&w=800\",\"id\":6,\"foodName\":\"Paneer Tikka Masala\",\"category\":\"Indian\",\"description\":\"Indian vegetarian dish made with marinated and grilled paneer cheese in a creamy tomato-based sauce.\",\"price\":60.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food7\",\"imageUrl\":\"https://images.pexels.com/photos/5848595/pexels-photo-5848595.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":7,\"foodName\":\"Peking Duck\",\"category\":\"Chinese\",\"description\":\"Traditional Chinese dish known for its crispy skin, tender meat, and served with thin pancakes, scallions, and hoisin sauce.\",\"price\":50.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food8\",\"imageUrl\":\"https://images.pexels.com/photos/3892469/pexels-photo-3892469.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":8,\"foodName\":\"Croissant\",\"category\":\"French\",\"description\":\"Buttery and flaky pastry of French origin, often enjoyed for breakfast or as a snack.\",\"price\":20.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food9\",\"imageUrl\":\"https://media.istockphoto.com/id/1301430432/photo/spanakopita.jpg?b=1&s=612x612&w=0&k=20&c=QWhpg06LIpWMfTPALYloM_ije4D_s9hu98sgXBunrzI=\",\"id\":9,\"foodName\":\"Spanakopita\",\"category\":\"Greek\",\"description\":\"Traditional Greek dish made with layers of flaky phyllo pastry filled with spinach, feta cheese, and herbs.\",\"price\":100.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food10\",\"imageUrl\":\"https://images.pexels.com/photos/5773968/pexels-photo-5773968.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":10,\"foodName\":\"Bibimbap\",\"category\":\"Korean\",\"description\":\"Korean mixed rice dish with an assortment of vegetables, meat, and a fried egg, served with gochujang sauce.\",\"price\":100.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food11\",\"imageUrl\":\"https://images.pexels.com/photos/6940997/pexels-photo-6940997.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":11,\"foodName\":\"Margherita Pizza\",\"category\":\"Italian\",\"description\":\"Classic Italian pizza topped with fresh mozzarella cheese, tomato sauce, and basil leaves.\",\"price\":10.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food12\",\"imageUrl\":\"https://images.pexels.com/photos/10398943/pexels-photo-10398943.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":12,\"foodName\":\"Tom Yum Soup\",\"category\":\"Thai\",\"description\":\"Spicy and sour Thai soup made with lemongrass, kaffir lime leaves, galangal, shrimp, and mushrooms.\",\"price\":10.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food13\",\"imageUrl\":\"https://images.pexels.com/photos/884596/pexels-photo-884596.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":13,\"foodName\":\"Tempura\",\"category\":\"Japanese\",\"description\":\"Lightly battered and deep-fried seafood or vegetables, served with a dipping sauce.\",\"price\":10.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food14\",\"imageUrl\":\"https://images.pexels.com/photos/8471716/pexels-photo-8471716.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":14,\"foodName\":\"Tacos de Carnitas\",\"category\":\"Mexican\",\"description\":\"Mexican street-style tacos made with slow-cooked, tender and crispy pork carnitas.\",\"price\":10.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food15\",\"imageUrl\":\"https://images.pexels.com/photos/750073/pexels-photo-750073.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":15,\"foodName\":\"Cheeseburger\",\"category\":\"American\",\"description\":\"Classic American burger topped with cheese, lettuce, tomato, onion, and condiments.\",\"price\":10.99,\"quantity\":0}'),
    jsonDecode(
        '{\"foodUrl\":\"https://www.example.com/food16\",\"imageUrl\":\"https://images.pexels.com/photos/2338407/pexels-photo-2338407.jpeg?auto=compress&cs=tinysrgb&w=800\",\"id\":16,\"foodName\":\"Butter Chicken\",\"category\":\"Indian\",\"description\":\"Creamy and flavorful Indian dish made with tender chicken in a spiced tomato-based sauce.\",\"price\":10.99,\"quantity\":0}')
  ];
  List<dynamic> get ProductList => _ProductList;
  set ProductList(List<dynamic> _value) {
    _ProductList = _value;
    secureStorage.setStringList(
        'ff_ProductList', _value.map((x) => jsonEncode(x)).toList());
  }

  void deleteProductList() {
    secureStorage.delete(key: 'ff_ProductList');
  }

  void addToProductList(dynamic _value) {
    _ProductList.add(_value);
    secureStorage.setStringList(
        'ff_ProductList', _ProductList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromProductList(dynamic _value) {
    _ProductList.remove(_value);
    secureStorage.setStringList(
        'ff_ProductList', _ProductList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromProductList(int _index) {
    _ProductList.removeAt(_index);
    secureStorage.setStringList(
        'ff_ProductList', _ProductList.map((x) => jsonEncode(x)).toList());
  }

  void updateProductListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _ProductList[_index] = updateFn(_ProductList[_index]);
    secureStorage.setStringList(
        'ff_ProductList', _ProductList.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _myOrder = [];
  List<dynamic> get myOrder => _myOrder;
  set myOrder(List<dynamic> _value) {
    _myOrder = _value;
    secureStorage.setStringList(
        'ff_myOrder', _value.map((x) => jsonEncode(x)).toList());
  }

  void deleteMyOrder() {
    secureStorage.delete(key: 'ff_myOrder');
  }

  void addToMyOrder(dynamic _value) {
    _myOrder.add(_value);
    secureStorage.setStringList(
        'ff_myOrder', _myOrder.map((x) => jsonEncode(x)).toList());
  }

  void removeFromMyOrder(dynamic _value) {
    _myOrder.remove(_value);
    secureStorage.setStringList(
        'ff_myOrder', _myOrder.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromMyOrder(int _index) {
    _myOrder.removeAt(_index);
    secureStorage.setStringList(
        'ff_myOrder', _myOrder.map((x) => jsonEncode(x)).toList());
  }

  void updateMyOrderAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _myOrder[_index] = updateFn(_myOrder[_index]);
    secureStorage.setStringList(
        'ff_myOrder', _myOrder.map((x) => jsonEncode(x)).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}

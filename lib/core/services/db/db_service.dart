import 'package:innowi_task/core/constants/app_constants.dart';
import 'package:innowi_task/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class DbService {
  static DbService? _instance;
  late final Store store;

  DbService._create(this.store);

  static Future<DbService> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docsDir.path, AppConstants.dbPath));
    _instance = DbService._create(store);
    return _instance!;
  }

  static DbService get instance {
    if (_instance == null) {
      throw Exception(
          'DbService not initialized. Call DbService.create() first.');
    }
    return _instance!;
  }

  Future<void> addItem<T>(T item) async {
    final itemBox = store.box<T>();
    itemBox.put(item);
  }

  Future<List<T>> getItems<T>() async {
    final itemBox = store.box<T>();
    return itemBox.getAll();
  }

  Future<void> removeItem<T>(T item, int itemId) async {
    final itemBox = store.box<T>();
    itemBox.remove(itemId);
  }

  Future<void> updateItem<T>(T item) async {
    final itemBox = store.box<T>();
    itemBox.put(item);
  }

  Future<void> clearItems<T>() async {
    final itemBox = store.box<T>();
    itemBox.removeAll();
  }
}

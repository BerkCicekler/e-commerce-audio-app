import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

final class ProductInitialization {
  ProductInitialization._();

  static Future<void> Init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}

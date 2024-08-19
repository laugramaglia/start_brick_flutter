import 'dart:ui';

import 'package:example/core/config/local_db/const_type_id.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocaleAdapter extends TypeAdapter<Locale> {
  @override
  final int typeId = kLocaleTypeId;

  @override
  Locale read(BinaryReader reader) {
    final languageCode = reader.readString();
    final countryCode = reader.readString();
    return Locale(languageCode, countryCode.isNotEmpty ? countryCode : null);
  }

  @override
  void write(BinaryWriter writer, Locale obj) {
    writer.writeString(obj.languageCode);
    writer.writeString(obj.countryCode ?? '');
  }
}

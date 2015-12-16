library free_poll.rot_converter;

import 'dart:convert';

/// A simple extension of Rot13 to bytes and a key.
class RotConverter extends Converter<List<int>, List<int>> {
  final _key;

  const RotConverter(this._key);

  List<int> convert(List<int> data, { int key }) {
    if (key == null) key = this._key;
    var result = new List<int>(data.length);
    for (int i = 0; i < data.length; i++) {
      result[i] = (data[i] + key) % 256;
    }
    return result;
  }
}
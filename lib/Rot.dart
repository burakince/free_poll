library free_poll.rot;

import 'dart:convert';
import 'package:free_poll/RotConverter.dart';

class Rot extends Codec<List<int>, List<int>> {
  final _key;

  const Rot(this._key);

  List<int> encode(List<int> data, { int key }) {
    if (key == null) key = this._key;
    return new RotConverter(key).convert(data);
  }

  List<int> decode(List<int> data, { int key }) {
    if (key == null) key = this._key;
    return new RotConverter(-key).convert(data);
  }

  RotConverter get encoder => new RotConverter(_key);

  RotConverter get decoder => new RotConverter(-_key);
}
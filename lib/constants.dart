import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 234, 82, 81);
const kSecondaryColor = Color.fromARGB(255, 65, 84, 93);
const kPrimaryLightColor = Color.fromARGB(255, 255, 255, 255);
const kPrimaryDarkColor = Color.fromARGB(255, 22, 22, 22);

mixin ReadyNotifier {
  Future<void> awaitReady() {
    return Future.doWhile(() =>
        Future.delayed(const Duration(milliseconds: 10)).then((_) => !ready));
  }

  List<void Function()> callbacks = List.empty(growable: true);
  bool ready = false;
  void getReady() {
    ready = true;
    _readyNotifyListeners();
  }

  void addReadyListener(void Function() listener) {
    if (ready) {
      listener();
    }
    callbacks.add(listener);
  }

  void removeReadyListener(void Function() listener) {
    callbacks.remove(listener);
  }

  void _readyNotifyListeners() {
    for (void Function() func in callbacks) {
      func();
    }
  }
}
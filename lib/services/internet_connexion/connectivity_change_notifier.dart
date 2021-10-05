import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';


// on utilise l'heritage ChangeNotifier pour écouter les changements
class ConnectivityChangeNotifier extends ChangeNotifier {
  ConnectivityChangeNotifier() {
    Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) {
      resultHandler(result);
    });
  }
  ConnectivityResult _connectivityResult = ConnectivityResult.wifi;
  String _pageText = "Vous n'avez pas internet 😥";

  ConnectivityResult get connectivity => _connectivityResult;
  String get pageText => _pageText;

  void resultHandler(ConnectivityResult result) {
    _connectivityResult = result;
    if (result == ConnectivityResult.none || result == ConnectivityResult.mobile) {
      _pageText = "";
    }
    notifyListeners();
  }

  void initialLoad() async {
    ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());
    resultHandler(connectivityResult);
  }
}
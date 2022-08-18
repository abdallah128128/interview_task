import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interview_task/core/constants.dart';
import 'package:interview_task/core/local_data/shared_preferences/cache_helper.dart';
import 'package:interview_task/core/network/web_services.dart';
import 'package:mac_address/mac_address.dart';

import '../injector.dart';

class SharedMethods{
  static Future<void> initPlatformState() async {
    macAddress = CacheHelper.getData(key: 'macAdd');
    if(macAddress == null) {
      String platformVersion;
      try {
        platformVersion = await GetMac.macAddress;
      } on PlatformException {
        platformVersion = 'Failed to get Device MAC Address.';
      }
      macAddress = platformVersion;
      CacheHelper.saveData(key: 'macAdd', value: macAddress);
    }
    
    await getIt.get<WebServices>().postMacAdd(
        {'MacAddress': macAddress, 'Language': 1, 'country': 65}).then((value) {
          debugPrint(value.toString());
    }).catchError((error){
      debugPrint(error.toString());
    });
  }
}
void showToast({
  required String text,
  required Color backgroundColor,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
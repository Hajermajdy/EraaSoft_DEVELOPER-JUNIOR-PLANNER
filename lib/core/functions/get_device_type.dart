import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enums/device_type.dart';

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  Orientation orientation = mediaQueryData.orientation;
  double width = 0;

  if (orientation == Orientation.landscape) {
    width = mediaQueryData.size.height;
  } else {
    width = mediaQueryData.size.width;
  }

  if (width >= 950) {
    return DeviceType.Desktop;
  } else if (width >= 600) {
    return DeviceType.Tablet;
  } else {
    return DeviceType.Mobile;
  }
}

import 'package:flutter/material.dart';

ColorFilter getFilter(int selectedFilter) {
  switch (selectedFilter) {
    case 1:
      return const ColorFilter.mode(Colors.orangeAccent, BlendMode.softLight);

    case 2:
      return const ColorFilter.mode(Colors.blueAccent, BlendMode.softLight);

    case 3:
      return const ColorFilter.mode(Colors.redAccent, BlendMode.softLight);

    case 4:
      return const ColorFilter.mode(Colors.purpleAccent, BlendMode.softLight);

    case 5:
      return const ColorFilter.mode(Colors.greenAccent, BlendMode.softLight);

    case 6:
      return const ColorFilter.mode(Colors.amberAccent, BlendMode.softLight);

    case 7:
      return const ColorFilter.mode(Colors.cyanAccent, BlendMode.softLight);

    default:
      return const ColorFilter.mode(Colors.transparent, BlendMode.srcOver);
  }
}

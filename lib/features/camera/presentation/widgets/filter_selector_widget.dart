import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildFilterSelector(int selectedFilter, Function(int) onFilterSelected ) {
  return Positioned(
    bottom: 140,
    left: 0,
    right: 0,
    child: SizedBox(
      height: 60.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: ((context, index) {
          final filter = filters[index];
      
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: buildFilterItem(
              icon: filter["icon"] as IconData,
              color: filter["color"] as Color,
              isSelected: selectedFilter == index,
              onTap: () => onFilterSelected(index),
            ),
          );
        }),
      ),
    ),
  );
}

Widget buildFilterItem({
  required IconData icon,
  required Color color,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: isSelected ? color : Colors.black54,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.white : Colors.transparent,
          width: 2.w,
        ),
      ),
      child: Icon(icon, color: Colors.white),
    ),
  );
}

final filters = [
  {"icon": Icons.not_interested, "color": Colors.grey},
  {"icon": Icons.wb_sunny, "color": Colors.orange},
  {"icon": Icons.ac_unit, "color": Colors.blue},
  {"icon": Icons.favorite, "color": Colors.red},
  {"icon": Icons.nightlight_round, "color": Colors.purple},
  {"icon": Icons.eco, "color": Colors.green},
  {"icon": Icons.star, "color": Colors.amber},
  {"icon": Icons.water_drop, "color": Colors.cyan},
];

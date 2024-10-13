import 'package:antrian_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class MenuPrinterContent extends StatelessWidget {
  final BluetoothInfo data;
  final bool isSelected;
  const MenuPrinterContent({
    super.key,
    required this.data,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: isSelected ? 4.0 : 1.0,
          color: isSelected ? AppColors.primary : AppColors.card,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name : $data{data.name}',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'macAddress : $data{data.macDddress}',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

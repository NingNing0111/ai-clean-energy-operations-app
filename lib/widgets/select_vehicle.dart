import 'package:ai_clean_energy_operations_app/models/common.dart';
import 'package:ai_clean_energy_operations_app/services/vehicle_service.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

// 车辆选择框
class SelectVehicle extends StatelessWidget {
  final void Function(LabelVO<String>?)? onChanged;

  const SelectVehicle({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LabelVO<String>>>(
      future: _loadVehicles(),
      builder: (context, snapshot) {
        return DropdownSearch<LabelVO<String>>(
          items: (f, cs) => snapshot.data ?? [],
          itemAsString: (item) => item.label,
          compareFn:
              (LabelVO<String> a, LabelVO<String> b) => a.value == b.value,
          decoratorProps: DropDownDecoratorProps(
            decoration: InputDecoration(labelText: "车辆", hintText: "请选择车辆"),
          ),
          popupProps: PopupProps.dialog(
            title: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '车辆列表',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            dialogProps: DialogProps(
              clipBehavior: Clip.antiAlias,
              shape: OutlineInputBorder(
                borderSide: BorderSide(width: 0),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          onChanged: onChanged,
        ); // 显示数据

      },
    );
  }

  // 异步加载车辆数据方法
  Future<List<LabelVO<String>>> _loadVehicles() async {
    try {
      final res = await simpleVehicle();
      if (res.code == 0) {
        return res.data;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}

import 'package:ai_clean_energy_operations_app/models/common.dart';
import 'package:ai_clean_energy_operations_app/services/route_line_service.dart';
import 'package:ai_clean_energy_operations_app/services/user_service.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class SelectDriver extends StatelessWidget {
  final void Function(LabelVO<String>?)? onChanged;

  const SelectDriver({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LabelVO<String>>>(
      future: _loadDriverUser(),
      builder: (context, snapshot) {
        return DropdownSearch<LabelVO<String>>(
          items: (f, cs) => snapshot.data ?? [],
          itemAsString: (item) => item.label,
          compareFn:
              (LabelVO<String> a, LabelVO<String> b) => a.value == b.value,
          decoratorProps: DropDownDecoratorProps(
            decoration: InputDecoration(labelText: "司机", hintText: "请选择司机"),
          ),
          popupProps: PopupProps.dialog(
            title: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '司机列表',
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
  Future<List<LabelVO<String>>> _loadDriverUser() async {
    try {
      final res = await simpleDriverUser();
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

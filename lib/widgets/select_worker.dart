import 'package:ai_clean_energy_operations_app/models/common.dart';
import 'package:ai_clean_energy_operations_app/services/route_line_service.dart';
import 'package:ai_clean_energy_operations_app/services/user_service.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class SelectWorker extends StatelessWidget {
  final void Function(LabelVO<String>?)? onChanged;

  const SelectWorker({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LabelVO<String>>>(
      future: _loadWorkerUser(),
      builder: (context, snapshot) {
        return DropdownSearch<LabelVO<String>>(
          items: (f, cs) => snapshot.data ?? [],
          itemAsString: (item) => item.label,
          compareFn:
              (LabelVO<String> a, LabelVO<String> b) => a.value == b.value,
          decoratorProps: DropDownDecoratorProps(
            decoration: InputDecoration(labelText: "收运工", hintText: "请选择收运工"),
          ),
          popupProps: PopupProps.dialog(
            title: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '收运工列表',
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
  Future<List<LabelVO<String>>> _loadWorkerUser() async {
    try {
      final res = await simpleWorkerUser();
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

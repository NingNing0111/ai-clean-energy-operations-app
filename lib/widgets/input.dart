import 'package:flutter/material.dart';

class InputValue extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? initialValue;
  final String label;
  final String hint;
  final bool enable;

  const InputValue({
    super.key,
    this.onChanged,
    this.initialValue,
    this.label = '请输入',
    this.hint = '请输入内容',
    this.enable = true
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8), // 与其他项统一高度
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey), // 与下划线风格对齐
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100, // 标签固定宽度，和其他组件对齐
            child: Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: TextField(
              enabled: enable,
              controller: TextEditingController(text: initialValue),
              onChanged: onChanged,
              textAlign: TextAlign.right, // 让输入的内容靠右显示
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none, // 去掉自带边框
                isCollapsed: true, // 减小内容内边距
                contentPadding: const EdgeInsets.symmetric(vertical: 4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

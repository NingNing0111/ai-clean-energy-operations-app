import 'package:flutter/material.dart';

class ConditionSelector extends StatefulWidget {
  final void Function(int?)? onChanged;
  final int? initialValue;

  const ConditionSelector({super.key, this.onChanged, this.initialValue});

  @override
  State<ConditionSelector> createState() => _ConditionSelectorState();
}

class _ConditionSelectorState extends State<ConditionSelector> {
  int? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 100,
            child: Text(
              '车况',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Radio<int>(
                  value: 1,
                  groupValue: _selectedValue,
                  onChanged: (val) {
                    setState(() {
                      _selectedValue = val;
                    });
                    widget.onChanged?.call(val);
                  },
                ),
                const Text('正常'),
                const SizedBox(width: 16),
                Radio<int>(
                  value: 0,
                  groupValue: _selectedValue,
                  onChanged: (val) {
                    setState(() {
                      _selectedValue = val;
                    });
                    widget.onChanged?.call(val);
                  },
                ),
                const Text('异常'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

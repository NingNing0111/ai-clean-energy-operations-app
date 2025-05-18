import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppItemDescription extends StatelessWidget {
   final String toPage;
   final String iconPath;
   final String title;

  const AppItemDescription({super.key, required this.toPage, required this.iconPath, required this.title,});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(toPage);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(iconPath,  width: 24,
            height: 24,
            ),
          const SizedBox(height: 6),
          Text(title, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

}
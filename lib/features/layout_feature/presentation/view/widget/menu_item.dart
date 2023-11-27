import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
      {super.key,
      required this.text,
      required this.icon,
      required this.context,
        this.color
      });

  final String text;
  final IconData icon;
  final BuildContext context;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  icon,
                  size: 20,
                  color:color ?? Colors.grey[700],
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

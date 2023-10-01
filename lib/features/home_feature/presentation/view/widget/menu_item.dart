import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
      {super.key,
      required this.text,
      required this.icon,
      required this.context});

  final String text;
  final IconData icon;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: 50,
            color: const Color(0xffF3FAF9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.title,
    required this.subTitle,
  });
  final IconData icon;
  final String title;
  final String subTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}

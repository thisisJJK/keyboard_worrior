import 'package:flutter/material.dart';
import 'package:keyboard_warrior/service/lang_service.dart';
import 'package:keyboard_warrior/service/theme_service.dart';
import 'package:provider/provider.dart';

class SpeedCard extends StatefulWidget {
  final double speed;
  final Duration? timer;
  const SpeedCard({super.key, required this.speed, this.timer});

  @override
  State<SpeedCard> createState() => _SpeedCardState();
}

class _SpeedCardState extends State<SpeedCard> {
  String _formatTimer(Duration timer) {
    final min = timer.inMinutes;
    final sec = timer.inSeconds % 60;
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    LangService langService = context.watch<LangService>();
    final Size mySize = MediaQuery.of(context).size;
    return SizedBox(
      height: mySize.height * 0.18,
      width: mySize.width,
      child: Card(
        color: context.color.powerCardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                langService.isKor ? '전투력' : 'Power',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: context.color.powerTextColor,
                ),
              ),
              Text(
                widget.speed.toStringAsFixed(0),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: context.color.powerTextColor,
                ),
              ),
              Text(
                _formatTimer(widget.timer!),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: context.color.powerTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

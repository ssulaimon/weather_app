import 'package:flutter/material.dart';

class ForecastWidget extends StatelessWidget {
  final String day;
  final String icon;
  final String temp;
  const ForecastWidget({
    super.key,
    required this.day,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: const Color(0xFF64AFB1),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          Image.network(
            "http:$icon",
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            temp,
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

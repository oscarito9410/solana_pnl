import 'package:flutter/material.dart';

class TokenDisplay extends StatelessWidget {
  final String logoUrl;
  final String name;
  final String price;
  final String profit;

  const TokenDisplay(
      {super.key,
      required this.logoUrl,
      required this.name,
      required this.price,
      required this.profit});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Logo
        CircleAvatar(
          // Adjust size to match the image
          backgroundImage: NetworkImage(logoUrl),
        ),
        const SizedBox(width: 8), // Spacing between logo and text
        // Text details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Symbol and price
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "USD: \$$price",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            // Percentage change
            Text(
              double.parse(profit) >= 0 ? "+" "\$$profit" : "\$$profit",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: double.parse(profit) >= 0
                    ? Colors.green
                    : Colors.red, // Positive change in green
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

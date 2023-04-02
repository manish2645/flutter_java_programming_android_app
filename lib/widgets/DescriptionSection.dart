import 'package:flutter/material.dart';

class DescriptionSection extends StatefulWidget {
  const DescriptionSection({super.key});

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
              "Flutter is Google's portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.",
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 20,
              ),  
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Course Length: ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),),
                Icon(
                  Icons.timer,
                  color: Colors.green[700],
                ),
                SizedBox(width: 5),
                Text(
                  "20 hours",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),)
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Rating: ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),),
                Icon(
                  Icons.star,
                  color: Colors.green[700],
                ),
                SizedBox(width: 5),
                Text(
                  "4.5",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),)
              ],
            ),
            
        ],
      ),
    );
  }
}

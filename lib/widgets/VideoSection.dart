import 'package:flutter/material.dart';

class VideoSection extends StatefulWidget {
  const VideoSection({super.key});

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

// static data for video
List videoList = [
  "Introduction to Flutter",
  "Installing Flutter on Windows",
  "Setup Emulator on Windows",
  "Creating Our First App",
];

class _VideoSectionState extends State<VideoSection> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return ListTile(
          leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: index == 0
                ? Colors.green[700]
                : Colors.green[700]?.withOpacity(0.6),
              shape: BoxShape.circle,

            ),
            child: Icon(Icons.play_arrow_rounded,
            color: Colors.white,
            size: 30,
            ), 
          ),
          title: Text(videoList[index]),
          subtitle: Text("20 min 50 sec"),
        );
      }),
    );
  }
}

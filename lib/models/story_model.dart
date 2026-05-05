import 'package:adud_project/screens/home/story_view_screen.dart';
import 'package:flutter/material.dart';

class StoryModel {
  final String name;
  final String coverImage;
  final String videoUrl;

  StoryModel({
    required this.name,
    required this.coverImage,
    required this.videoUrl,
  });
}

List<StoryModel> stories = [
  StoryModel(
    name: "تجربة 1",
    coverImage: "https://picsum.photos/200/200?random=1",
    videoUrl:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  ),
  StoryModel(
    name: "تجربة 2",
    coverImage: "https://picsum.photos/200/200?random=2",
    videoUrl:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
  ),
  StoryModel(
    name: "تجربة 1",
    coverImage: "https://picsum.photos/200/200?random=3",
    videoUrl:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  ),
  StoryModel(
    name: "تجربة 2",
    coverImage: "https://picsum.photos/200/200?random=4",
    videoUrl:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
  ),StoryModel(
    name: "تجربة 1",
    coverImage: "https://picsum.photos/200/200?random=5",
    videoUrl:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  ),
  StoryModel(
    name: "تجربة 2",
    coverImage: "https://picsum.photos/200/200?random=6",
    videoUrl:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
  ),
];
Widget buildStoryItem(BuildContext context, StoryModel story) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              StoryViewScreen(videoUrl: story.videoUrl, name: story.name),
        ),
      );
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blueAccent, width: 2),
          ),
          child: CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(story.coverImage),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          story.name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

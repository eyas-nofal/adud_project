import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryViewScreen extends StatefulWidget {
  final String videoUrl;
  final String name;

  const StoryViewScreen({super.key, required this.videoUrl, required this.name});

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        storyItems: [
          StoryItem.pageVideo(
            widget.videoUrl,
            controller: storyController,
            caption: Text(widget.name, 
                     style: const TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ],
        controller: storyController,
        onComplete: () => Navigator.pop(context), 
        onVerticalSwipeComplete: (dir) {
          if (dir == Direction.down) Navigator.pop(context);
        },
      ),
    );
  }
}
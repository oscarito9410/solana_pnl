import 'package:flutter/material.dart';
import 'package:solana_pnl/contants.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: StoryView(controller: controller, storyItems: [
          StoryItem.text(
              title:
                  "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
              backgroundColor: Colors.green,
              roundedTop: true,
              textStyle: TextStyle(fontFamily: pixelifyFont)),
          StoryItem.text(
              title: "Hello 2",
              backgroundColor: Colors.green,
              roundedTop: true,
              textStyle: TextStyle(fontFamily: 'Pixelify'))
        ]));
  }
}

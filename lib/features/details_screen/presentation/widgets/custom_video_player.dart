import 'package:education_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {

  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.network(
  //     'https://youtu.be/9vMcKcymOy0',
  //   )
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //     })
  //     ..addListener(() {
  //       if (_controller.value.isPlaying) {
  //         controls = GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               _controller.pause();
  //             });
  //           },
  //           child: Image.asset(
  //             icPause,
  //             height: 50,
  //           ),
  //         );
  //       } else if (_controller.value.position.inMilliseconds -
  //               _controller.value.duration.inMilliseconds <
  //           1) {
  //         setState(() {
  //           controls = GestureDetector(
  //             onTap: () {
  //               setState(() {
  //                 _controller.play();
  //               });
  //             },
  //             child: Image.asset(
  //               icLearning,
  //               height: 50,
  //             ),
  //           );
  //         });
  //       } else {
  //         controls = GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               _controller.play();
  //             });
  //           },
  //           child: Image.asset(
  //             icLearning,
  //             height: 50,
  //           ),
  //         );
  //       }
  //     });
  // }
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    String url = widget.url;
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: controller,
          ),
          builder: (context,player){
            return player;
          },
        ),
      ],
    );
  }
}

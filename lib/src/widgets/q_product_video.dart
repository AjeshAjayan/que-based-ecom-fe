import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class QProductVideo extends StatefulWidget {
  final String networkURL;
  final Function onError;

  const QProductVideo({
    super.key,
    required this.networkURL,
    required this.onError,
  });

  @override
  State<QProductVideo> createState() => _QProductVideoState();
}

class _QProductVideoState extends State<QProductVideo> {
  late VideoPlayerController _videoController;
  bool _hasError = false;

  @override
  void initState() {
    _videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.networkURL))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          }).catchError((error) {
            setState(() {
              _hasError = true;
            });
            Future.delayed(const Duration(milliseconds: 500), () {
              widget.onError();
            });
          });
    super.initState();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _videoController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            )
          : _hasError
              ? Text('Unable to play ${widget.networkURL}')
              : const CircularProgressIndicator(),
    );
  }
}

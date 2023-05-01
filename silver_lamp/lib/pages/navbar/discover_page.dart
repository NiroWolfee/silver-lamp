import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final File videoFile;

  const VideoPlayerWidget({Key? key, required this.videoFile})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile);
    _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.pause();
    _controller.dispose();
  }

  @override
  void didUpdateWidget(covariant VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoFile != oldWidget.videoFile) {
      _controller.pause();
      _controller.dispose();
      _controller = VideoPlayerController.file(widget.videoFile);
      _controller.initialize().then((_) {
        setState(() {});
      });
    }
  }

  void _togglePlay() {
    if (_isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlay,
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoPlayer(_controller),
                  AnimatedOpacity(
                    opacity: _isPlaying ? 0 : 1,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: Icon(Icons.play_arrow, size: 64),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  File? _videoFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadVideo() async {
    if (_videoFile == null) {
      return;
    }
    // TODO: Implement backend upload logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Video uploaded")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_videoFile == null)
            Center(
              child: Text("No video selected"),
            )
          else
            Center(
                child: Container(
              height: 300,
              child: VideoPlayerWidget(videoFile: _videoFile!),
            )),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _pickVideo,
            child: Text("Pick a video"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _uploadVideo,
            child: Text("Upload video"),
          ),
        ],
      ),
    );
  }
}

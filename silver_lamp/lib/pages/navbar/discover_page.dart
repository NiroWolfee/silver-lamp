import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  File? _videoFile;

  final ImagePicker _picker = ImagePicker();
  late VideoPlayerController _controller;
  final _snackBarDisplayDuration = Duration(seconds: 2);
  bool _initialized = false;

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
      _controller = VideoPlayerController.file(_videoFile!);
      _controller.addListener(() {
        if (_controller.value.isPlaying) {
          setState(() {});
        }
      });
      await _controller.initialize();
      _initialized = true;
      setState(() {});
    }
  }

  Future<void> _uploadVideo() async {
    if (_initialized) {
      // TODO: Implement backend upload logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Video uploaded"),
          duration: _snackBarDisplayDuration,
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
          else if (_initialized)
            Center(
                child: Container(
              height: 200,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ))
          else
            Center(
              child: CircularProgressIndicator(),
            ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _pickVideo,
            child: Text("Select video"),
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

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String videoPath;
  final bool isSilent;

  const VideoWidget({
    super.key,
    required this.videoPath,
    this.isSilent = false,
  });

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    // Determine if asset or network
    if (widget.videoPath.startsWith('http')) {
      _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoPath));
    } else {
      _videoPlayerController = VideoPlayerController.asset(widget.videoPath);
    }

    try {
      await _videoPlayerController.initialize();
      
      // Configuration based on 'isSilent' flag
      // isSilent (Palmares) -> Autoplay, Loop, Muted, No Controls (Ambient/GIF-like)
      // !isSilent (Cumbres/Porticos) -> Manual Play, Controls, Sound Enabled
      
      final bool shouldAutoplay = widget.isSilent;
      final bool shouldShowControls = !widget.isSilent;
      final double volume = widget.isSilent ? 0.0 : 1.0;
      final bool looping = widget.isSilent; // Loop ambient videos usually

      await _videoPlayerController.setVolume(volume);

      setState(() {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          autoPlay: shouldAutoplay,
          looping: looping,
          showControls: shouldShowControls,
          showControlsOnInitialize: shouldShowControls,
          showOptions: shouldShowControls, // Hide options menu if silent
          allowFullScreen: true,
          allowMuting: true,
          allowPlaybackSpeedChanging: false,
          
          materialProgressColors: ChewieProgressColors(
            playedColor: Colors.white,
            handleColor: Colors.white,
            backgroundColor: Colors.grey,
            bufferedColor: Colors.white24,
          ),
          placeholder: const Center(child: CircularProgressIndicator(color: Colors.white)),
          errorBuilder: (context, errorMessage) {
            return const Center(
              child: Text('Video unavailable', style: TextStyle(color: Colors.white)),
            );
          },
        );
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error initializing video: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_chewieController != null && _videoPlayerController.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: Chewie(controller: _chewieController!),
      );
    } else {
       return const Center(child: Text('Video unavailable', style: TextStyle(color: Colors.white)));
    }
  }
}

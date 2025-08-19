// lib/video_preview_player.dart
import 'package:flutter/material.dart';

class VideoPreviewPlayer extends StatelessWidget {
  final String videoUrl;
  final String thumbnailUrl;
  final String videoId;
  final int initialViews;
  final Future<void> Function()? onOpenFull;

  const VideoPreviewPlayer({
    super.key,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.videoId,
    required this.initialViews,
    this.onOpenFull,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              thumbnailUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Container(
                  color: Colors.black12,
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, err, st) => Container(
                color: Colors.black12,
                child: const Center(child: Icon(Icons.broken_image, size: 48)),
              ),
            ),

            // Play button
            IconButton(
              icon: const Icon(Icons.play_circle_fill, size: 64, color: Colors.white),
              onPressed: () async {
                if (onOpenFull != null) {
                  await onOpenFull!();
                } else {
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
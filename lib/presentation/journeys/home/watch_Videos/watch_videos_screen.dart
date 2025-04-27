import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/common/extension/string_extension.dart';
import 'package:movie_app/domain/entities/vedios_entities.dart';
import 'package:movie_app/presentation/journeys/home/watch_Videos/watch_videos_Arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:movie_app/common/constants/translation_constanats.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WatchVideosScreen extends StatefulWidget {
  final WatchVideosArguments watchVideosArguments;
  const WatchVideosScreen({super.key, required this.watchVideosArguments});

  @override
  State<WatchVideosScreen> createState() => _WatchVideosScreenState();
}

class _WatchVideosScreenState extends State<WatchVideosScreen> {
  late List<VediosEntities> _videos;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _videos = widget.watchVideosArguments.vedios;
    _controller = YoutubePlayerController(
      initialVideoId: _videos[0].key,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            TranslationConstants.watchTrailers.t(context),
          ),
        ),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < _videos.length; i++)
                        Container(
                          height: 60.h,
                          padding: EdgeInsets.symmetric(vertical: Sizes.dimen_8.h),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _controller.load(_videos[i].key);
                                  _controller.play();
                                },
                                child: CachedNetworkImage(
                                  width: Sizes.dimen_200.w,
                                  fit: BoxFit.cover,
                                  imageUrl: 'https://img.youtube.com/vi/${_videos[i].key}/hqdefault.jpg',
                                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(
                                    _videos[i].title,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

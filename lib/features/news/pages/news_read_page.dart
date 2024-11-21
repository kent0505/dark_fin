import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/fonts.dart';
import '../../../core/models/news.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/pop_button.dart';

class NewsReadPage extends StatelessWidget {
  const NewsReadPage({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: getStatusBar(context, height: 6)),
          Row(
            children: [
              const SizedBox(width: 22),
              PopButton(
                title: 'Back',
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              children: [
                const SizedBox(height: 7),
                Text(
                  news.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: Fonts.w800,
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    // like button
                    SizedBox(width: 32),
                    // share button
                  ],
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: CachedNetworkImage(
                    imageUrl: news.image,
                    width: double.infinity,
                    height: 285,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  news.time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: Fonts.w400,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xff343434),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    news.body,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: Fonts.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';
import 'dart:ui';

import 'package:bibleapp/features/books/model/export_model.dart';
import 'package:bibleapp/helpers/assets_constant.dart';
import 'package:bibleapp/widgets/widget_export.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BibleBookWidget extends StatelessWidget {
  final BookData books;

  BibleBookWidget({required this.books});

  @override
  Widget build(BuildContext context) {
    String link = RandomImages.getRandomImageAsset();
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: link,
              placeholder: (c, st) => SizedBox(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.2), // Adjust the opacity here
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: CustomText(
              textAlign: TextAlign.center,
              title: books.name,
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

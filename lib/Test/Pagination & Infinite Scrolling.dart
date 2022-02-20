import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'dart:math';

import '../home.dart';

class Pagination_Infinite_Scrolling extends StatefulWidget {
  const Pagination_Infinite_Scrolling({Key? key}) : super(key: key);

  @override
  _Pagination_Infinite_ScrollingState createState() =>
      _Pagination_Infinite_ScrollingState();
}

class _Pagination_Infinite_ScrollingState
    extends State<Pagination_Infinite_Scrolling> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;



  final queryPost = FirebaseFirestore.instance
      .collection('Products')
      .orderBy('createdAt', descending: true)
      .withConverter<Post>(
        fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
        toFirestore: (post, _) => post.toJson(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagination_Infinite_Scrolling'),
          centerTitle: true,
        ),
        body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FirestoreQueryBuilder(
                    query: queryPost,
                    pageSize: 20,
                    builder: (BuildContext context,
                        FirestoreQueryBuilderSnapshot<dynamic> snapshot,
                        Widget? child) {
                      if (snapshot.isFetching) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Somethink as wrong! ${snapshot.hasError}');
                      } else {
                        return GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: snapshot.docs.length,
                            itemBuilder: (context, index) {
                              final hasEndReached = snapshot.hasMore &&
                                  index + 1 == snapshot.docs.length &&
                                  !snapshot.isFetchingMore;
                              if (hasEndReached) {
                                snapshot.fetchMore();
                              }
                              final post = snapshot.docs[index].data();
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Container(
                                  child: carda(post: post),
                                ),
                              );
                            });
                      }
                    }),
              ),


        );
  }
}

class carda extends StatelessWidget {
  const carda({
    Key? key,
    required this.post,
  }) : super(key: key);

  final  post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black
                    ],
                  ).createShader(Rect.fromLTRB(
                      0,
                      0,
                      rect.width,
                      rect.height));
                },
                blendMode: BlendMode.darken,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: post.themb,
                  errorWidget:
                      (context, url, error) =>
                          Icon(Icons.error),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    4, 12, 0, 0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  post.decription.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    fontFamily: 'Oswald',
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    post.price.toUpperCase() +
                        '.00 DZD',
                    overflow:
                        TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'Oswald',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment:
                      Alignment.bottomRight,
                  child: Text(
                    post.likes.toUpperCase(),
                    overflow:
                        TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight:
                          FontWeight.normal,
                      fontSize: 12,
                      fontFamily: 'Oswald',
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.favorite,
                color: Colors.blue,
                size: 14.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


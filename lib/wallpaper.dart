import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/fullscreen.dart';

class Wallpaper extends StatefulWidget {
  const Wallpaper({Key? key}) : super(key: key);

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  List images = [];
  int page = 1;
  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers: {
          'Authorization':
              '563492ad6f91700001000001dd12b43f42c8425c8d50e684944b7468'
        }).then((value) {
      print(value.body);
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      print(images[0]);
    });
  }

  loadmore() async {
    setState(() {
      page = page + 1;
    });
    String url =
        'https://api.pexels.com/v1/curated?per_page=80&page=' + page.toString();
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001dd12b43f42c8425c8d50e684944b7468'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        Expanded(
            child: Container(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  childAspectRatio: 2 / 3),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FullScreen(
                                imageurl: images[index]['src']['large2x'])));
                  },
                  child: Container(
                    color: Colors.white,
                    child: Image.network(
                      images[index]['src']['tiny'],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
        )),
        InkWell(
          onTap: () {
            loadmore();
          },
          child: Container(
            color: Colors.black,
            height: 60,
            width: double.infinity,
            child: 'LOAD HERE'.text.white.makeCentered(),
          ),
        ),
      ]),
    );
  }
}

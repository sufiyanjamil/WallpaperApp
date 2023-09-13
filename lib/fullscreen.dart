// ignore_for_file: unused_import, library_private_types_in_public_api, implementation_imports

import 'package:file/src/interface/file.dart';
import 'package:flutter/material.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class FullScreen extends StatefulWidget {
  final String imageurl;

  const FullScreen({Key? key, required this.imageurl}) : super(key: key);
  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> _setwallpaper(location) async {
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    try {
      WallpaperManagerFlutter().setwallpaperfromFile(file, location);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wallpaper updated'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error Setting Wallpaper'),
        ),
      );
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Container(
              child: Image.network(widget.imageurl),
            ),
          ),
          InkWell(
            onTap: () {
              _setwallpaper(WallpaperManagerFlutter.BOTH_SCREENS);
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text('Set Wallpaper on both Screens',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          )
        ],
      )),
    );
  }
}

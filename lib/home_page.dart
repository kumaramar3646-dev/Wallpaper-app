/*
import 'dart:convert';

import 'package:api_wallpaper_app/wallpaper_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PhotosModel> mPhotos = [];

  @override
  void initState() {
    super.initState();
    getAllPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallpaper App", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
      body: mPhotos.isNotEmpty ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
          ),
          itemCount: mPhotos.length,
          itemBuilder: (_, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.cyan,
                  ),
                  child: Card(
                    child: Image.network(mPhotos[index].src.original),
                  ),
                ),
              ),
            );
          }):Center(
        child: Text("No Photos"),
      ),
    );
  }
  void getAllPhotos()async{
    String url = "https://api.pexels.com/v1/search?query=nature&per";
    var response = await http.get(Uri.parse(url),headers: {
      "Authorization":"XGZvjxOZFmryZcHgixfjKFRWxJ3VSJdlThtP9TQYtCFkW5EW1dnd0g8P"
    });

    if(response.statusCode==200){
      var mData = jsonDecode(response.body);
      print("res: ${response.body}");

      dynamic data = jsonDecode(response.body);
      mPhotos = WallpaperModel.fromJson(data).photos;
      setState(() {

      });


    }
  }
}
*/

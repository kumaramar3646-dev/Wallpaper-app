import 'dart:convert';

//import 'package:api_wallpaper_app/model/color_tone_model.dart';
import 'package:api_wallpaper_app/model/wallpaper_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageUi extends StatefulWidget {
  const HomePageUi({super.key});

  @override
  State<HomePageUi> createState() => _HomePageUiState();
}

class _HomePageUiState extends State<HomePageUi> {
  List<PhotosModel> mPhotos = [];

  /// ===========  List<ColorToneModel> mColorTone = [];

  @override
  void initState() {
    super.initState();
    getBestOfTheMonthApi();

    /// ======  =====  getColorToneApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(
          "WallPaper App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        //scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Find WallPaper..",
                  hintStyle: TextStyle(fontSize: 18),
                  suffixIcon: Icon(Icons.search_outlined, size: 30),
                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
              ),
              SizedBox(height: 11),
              Text(
                "Best of the month",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Divider(color: Colors.blueGrey),
              //SizedBox(height: 18),
              SizedBox(
                height: 275,
                width: double.infinity,
                child: mPhotos.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mPhotos.length,
                        itemBuilder: (_, index) {
                          return getAllBestOfTheMonth(mPhotos[index]);
                        },
                      )
                    : Center(
                        child: Text(
                          "No Photos",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),

              SizedBox(height: 11),
              Text(
                "The color tone",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Divider(color: Colors.blueGrey),
              SizedBox(
                height: 85,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 50,
                  itemBuilder: (_, index) {
                    return getAllColorTone(index);
                  },
                ) /*:Center(child: Text("No Colors", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),),*/,
              ),

              SizedBox(height: 11),
              Text(
                "Categories",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Divider(color: Colors.blueGrey),
              SizedBox(
                height: 400,
                width: 400,
                child: ListView.builder(
                  itemCount: mPhotos.length,
                  itemBuilder: (_, index) {
                    return getAllCategories(mPhotos[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_outlined),
            label: "Download",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  /// ==============  ======================  ======================  ==================
  /// Best of the month
  Widget getAllBestOfTheMonth(PhotosModel photo) {
    return Container(
      height: 275,
      width: 175,
      margin: EdgeInsets.only(right: 21),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        image: DecorationImage(
          image: NetworkImage(photo.src.portrait),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// Color tone
  Widget getAllColorTone(/*ColorToneModel color*/ int index) {
    final Color = Colors.primaries;
    return Container(
      height: 85,
      width: 85,
      margin: EdgeInsets.only(right: 11),
      decoration: BoxDecoration(
        color: Color[index % Color.length],
        borderRadius: BorderRadius.circular(25),
        /* image: DecorationImage(
          image: NetworkImage(color.src.portrait),
          fit: BoxFit.cover,*/
      ),
    );
  }

  /// Categories
  Widget getAllCategories(PhotosModel photo) {
    /*List<String> categoriesName = [
      "Nature", "Animal", "Space", "City",
      "man", "plant", "cloud", "forest"
    ];*/
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 1.5,
      children: List.generate(mPhotos.length, (index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            image: DecorationImage(
              image: NetworkImage(photo.src.portrait),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Center(
              child: Text("Nature",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  /// Best of the month api
  void getBestOfTheMonthApi() async {
    String url = "https://api.pexels.com/v1/search";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      print("res: ${res.body}");
      dynamic data = jsonDecode(res.body);
      mPhotos = WallpaperModel.fromJson(data).photos;
      setState(() {});
    }
  }

  /// Color tone api
  /*void getColorToneApi()async{
    String url = "https://api.pexels.com/v1/search";
    var res = await http.get(Uri.parse(url));
    if(res.statusCode==200){
      print("res: ${res.body}");
      dynamic data = jsonDecode(res.body);
      mPhotos = WallpaperModel.fromJson(data).photos;
      setState(() {

      });
    }

  }*/
}

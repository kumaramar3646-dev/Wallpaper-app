
class WallpaperModel{
  String next_page;
  int page;
  int per_page;
  int total_results;
  List<PhotosModel> photos;

  WallpaperModel({
    required this.next_page,
    required this.page,
    required this.per_page,
    required this.total_results,
    required this.photos,
});
  /// from json

    factory WallpaperModel.fromJson(Map<String, dynamic> json){

      List<PhotosModel> mPhotos = [];
      for(Map<String, dynamic> eachmap in json["photos"]){
        mPhotos.add(PhotosModel.fromJson(eachmap));
      }
      return WallpaperModel(
        next_page: json['next_page'],
        page: json['page'],
        per_page: json['per_page'],
        total_results: json['total_results'],
        photos: mPhotos);
    }

}

class PhotosModel{
  String alt;
  String avg_color;
  int height;
  int id;
  bool liked;
  String photographer;
  int photographer_id;
  String photographer_url;
  String url;
  int width;
  SourceModel src;

  PhotosModel({
    required this.alt,
    required this.avg_color,
    required this.height,
    required this.id,
    required this.liked,
    required this.photographer,
    required this.photographer_id,
    required this.photographer_url,
    required this.url,
    required this.width,
    required this.src,
  });

  /// from json

    factory PhotosModel.fromJson(Map<String, dynamic> json){
    return PhotosModel(
      alt: json["alt"],
      avg_color: json["avg_color"],
        height: json["height"],
        id: json["id"],
        liked: json["liked"],
        photographer: json["photographer"],
        photographer_id: json["photographer_id"],
        photographer_url: json["photographer_url"],
        url: json["url"],
        width: json["width"],
        src: SourceModel.fromJson(json["src"])
    );
    }






}

class SourceModel{
  String landscape;
  String large;
  String large2x;
  String medium;
  String original;
  String portrait;
  String small;
  String tiny;

  SourceModel({
    required this.landscape,
    required this.large,
    required this.large2x,
    required this.medium,
    required this.original,
    required this.portrait,
    required this.small,
    required this.tiny,
  });
  /// from json

    factory SourceModel.fromJson(Map<String, dynamic> json){
    return SourceModel(
        landscape: json['landscape'],
        large: json['large'],
        large2x: json['large2x'],
        medium: json['medium'],
        original: json['original'],
        portrait: json['portrait'],
        small: json['small'],
        tiny: json['tiny'],);
    }
      

}

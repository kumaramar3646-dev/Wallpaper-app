/*
class DataToneModel{
  String next_page;
  int page;
  int per_page;
  int total_results;
  List<ColorToneModel> photos;
 DataToneModel({
    required this.next_page,
    required this.page,
    required this.per_page,
    required this.total_results,
    required this.photos,
});
  /// from json
  factory DataToneModel.fromJson(Map<String, dynamic> json){
    List<ColorToneModel> mPhotos = [];
    for(Map<String, dynamic> eachmap in json['photos']){
      mPhotos.add(ColorToneModel.fromJson(eachmap));
    }
    return DataToneModel(
      next_page: json['next_page'],
      page: json['page'],
      per_page: json['per_page'],
      total_results: json['total_results'],
      photos: mPhotos,
    );
  }
}

class ColorToneModel {
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
     SourseModel src;
     ColorToneModel({
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
     factory ColorToneModel.fromJson(Map<String, dynamic> json){
       return ColorToneModel(
         alt: json['alt'],
         avg_color: json['avg_color'],
         height: json['height'],
         id: json['id'],
         liked: json['liked'],
         photographer: json['photographer'],
         photographer_id: json['photographer_id'],
         photographer_url: json['photographer_url'],
         url: json['url'],
         width: json['width'],
         src: SourseModel.fromJson(json['src']),
       );
     }
}

class SourseModel{
  String landscape;
  String large;
  String large2x;
  String medium;
  String original;
  String portrait;
  String small;
  String tiny;
  SourseModel({
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
    factory SourseModel.fromJson(Map<String, dynamic> json){
      return SourseModel(
        landscape: json['landscape'],
        large: json['large'],
        large2x: json['large2x'],
        medium: json['medium'],
        original: json['original'],
        portrait: json['portrait'],
        small: json['small'],
        tiny: json['tiny'],
      );
    }
}*/

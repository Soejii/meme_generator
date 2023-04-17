class MemeModel {
  String? id;
  String? name;
  String? url;
  int? width;
  int? height;
  int? boxCount;
  int? captions;

  MemeModel(
      {this.id,
      this.name,
      this.url,
      this.width,
      this.height,
      this.boxCount,
      this.captions});

  MemeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
    boxCount = json['box_count'];
    captions = json['captions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    data['box_count'] = this.boxCount;
    data['captions'] = this.captions;
    return data;
  }
}

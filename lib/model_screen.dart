/// List --------------------->>>> List
// {
// "place":"surat",
// "name":"oppo"
// }

/// Model --------------------->>>> Model
class MobileDataModel {
  final String? place;
  final String? name;

  MobileDataModel({
    this.place,
    this.name,
  });

  MobileDataModel.fromJson(Map<String, dynamic> json)
      : place = json['place'] as String?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {
    'place' : place,
    'name' : name
  };
}




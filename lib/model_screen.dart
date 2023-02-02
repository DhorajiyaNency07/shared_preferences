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




// class MobileDataModel {
//   final String? place;
//   final List<MobileData>? mobileData;
//
//   MobileDataModel({
//     this.place,
//     this.mobileData,
//   });
//
//   MobileDataModel.fromJson(Map<String, dynamic> json)
//       : place = json['place'] as String?,
//         mobileData = (json['mobile_data'] as List?)?.map((dynamic e) => MobileData.fromJson(e as Map<String,dynamic>)).toList();
//
//   Map<String, dynamic> toJson() => {
//     'place' : place,
//     'mobile_data' : mobileData?.map((e) => e.toJson()).toList()
//   };
// }
//
// class MobileData {
//   final String? mobileName;
//   final int? price;
//
//   MobileData({
//     this.mobileName,
//     this.price,
//   });
//
//   MobileData.fromJson(Map<String, dynamic> json)
//       : mobileName = json['mobile_name'] as String?,
//         price = json['price'] as int?;
//
//   Map<String, dynamic> toJson() => {
//     'mobile_name' : mobileName,
//     'price' : price
//   };
// }
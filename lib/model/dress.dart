class Dress {
  String? sizeView;
  String? color;
  dynamic size;
  String? type;

  Dress(
      {required this.sizeView,
        required this.color,
        required this.type});

  Dress.fromJson(Map<String, dynamic> mp)
      : sizeView = mp["sizeView"],
        color = mp["color"],
        size = mp["size"],
        type = mp["type"];



  /// this is lambda  function .type is return for Map from Object
  Map<String, dynamic> toJson() =>
      {"sizeView": sizeView, "color": color, "size": size, "type": type};
}

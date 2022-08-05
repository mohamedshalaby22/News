class Source {
  String? name, id;
  Source({
    required this.id,
    required this.name,
  });
  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

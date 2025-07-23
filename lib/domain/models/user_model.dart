
class User {
  const User({
    required this.id,
   this.email,
   this.name,
   this.photo
});

  final String id;
  final String? email;
  final String? name;
  final String? photo;
  static const User empty = User(id: '');
  bool get isEmpty => id == '';
}
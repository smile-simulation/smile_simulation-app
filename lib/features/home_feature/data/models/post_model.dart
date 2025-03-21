class PostModel {
  final String id;
  final String userName;
  final String userImage;
  final String content;
  final String? postImage;
  final String postDate;
  int likes; // قابل للتعديل
  final int commentsCount;
  bool isLikedByCurrentUser; // حالة الإعجاب

  PostModel({
    required this.id,
    required this.userName,
    required this.userImage,
    required this.content,
    this.postImage,
    required this.postDate,
    required this.likes,
    required this.commentsCount,
    this.isLikedByCurrentUser = false,
  });

  // تحديث حالة الإعجاب وزيادة/نقصان عدد الإعجابات
  void toggleLike() {
    if (isLikedByCurrentUser) {
      likes--; // تقليل العدد إذا كان المستخدم قد أعجب مسبقًا
    } else {
      likes++; // زيادة العدد إذا لم يكن معجبًا
    }
    isLikedByCurrentUser = !isLikedByCurrentUser;
  }

  // تحويل من JSON إلى كائن
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userName: json['userName'],
      userImage: json['userImage'],
      content: json['content'],
      postImage: json['postImage'],
      postDate: json['postDate'],
      likes: json['likes'] ?? 0,
      commentsCount: json['commentsCount'] ?? 0,
      isLikedByCurrentUser: json['isLikedByCurrentUser'] ?? false,
    );
  }

  // تحويل من كائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'userImage': userImage,
      'content': content,
      'postImage': postImage,
      'postDate': postDate,
      'likes': likes,
      'commentsCount': commentsCount,
      'isLikedByCurrentUser': isLikedByCurrentUser,
    };
  }
}

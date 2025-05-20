import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  final int? commentId;
  final String? content;
  final int? postId;
  final String? publisherId;
  final String? publisherName;
  final String? publisherImage;
  final DateTime? createdAt;

  const CommentModel({
    this.commentId,
    this.content,
    this.postId,
    this.publisherId,
    this.publisherName,
    this.publisherImage,
    this.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    commentId: json['commentId'] as int?,
    content: json['content'] as String?,
    postId: json['postId'] as int?,
    publisherId: json['publisherId'] as String?,
    publisherName: json['publisherName'] as String?,
    publisherImage: json['publisherImage'] as String?,
    createdAt:
        json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'commentId': commentId,
    'content': content,
    'postId': postId,
    'publisherId': publisherId,
    'publisherName': publisherName,
    'publisherImage': publisherImage,
    'createdAt': createdAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [
      commentId,
      content,
      postId,
      publisherId,
      publisherName,
      publisherImage,
      createdAt,
    ];
  }
}

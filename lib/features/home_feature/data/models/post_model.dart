import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
	final int? id;
	final dynamic content;
	final String? publisherId;
	final String? publisherName;
	final String? publisherImage;
	final String? postImage;
	final String? publisherRole;
	final DateTime? createdAt;
	final int? likesCount;
	final int? commentsCount;
	final bool? isLikedByCurrentUser;
	final List<dynamic>? comments;

	const PostModel({
		this.id, 
		this.content, 
		this.publisherId, 
		this.publisherName, 
		this.publisherImage, 
		this.postImage, 
		this.publisherRole, 
		this.createdAt, 
		this.likesCount, 
		this.commentsCount, 
		this.isLikedByCurrentUser, 
		this.comments, 
	});

	factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
				id: json['id'] as int?,
				content: json['content'] as dynamic,
				publisherId: json['publisherId'] as String?,
				publisherName: json['publisherName'] as String?,
				publisherImage: json['publisherImage'] as String?,
				postImage: json['postImage'] as String?,
				publisherRole: json['publisherRole'] as String?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				likesCount: json['likesCount'] as int?,
				commentsCount: json['commentsCount'] as int?,
				isLikedByCurrentUser: json['isLikedByCurrentUser'] as bool?,
				comments: json['comments'] as List<dynamic>?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'content': content,
				'publisherId': publisherId,
				'publisherName': publisherName,
				'publisherImage': publisherImage,
				'postImage': postImage,
				'publisherRole': publisherRole,
				'createdAt': createdAt?.toIso8601String(),
				'likesCount': likesCount,
				'commentsCount': commentsCount,
				'isLikedByCurrentUser': isLikedByCurrentUser,
				'comments': comments,
			};

	@override
	List<Object?> get props {
		return [
				id,
				content,
				publisherId,
				publisherName,
				publisherImage,
				postImage,
				publisherRole,
				createdAt,
				likesCount,
				commentsCount,
				isLikedByCurrentUser,
				comments,
		];
	}
}

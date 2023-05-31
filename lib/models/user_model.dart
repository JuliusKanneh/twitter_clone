import 'package:flutter/foundation.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final List<String> followers;
  final List<String> followings;
  final String bio;
  final String profilePic;
  final String bannerPic;
  final bool isTwitterBlue;
  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.followers,
    required this.followings,
    required this.bio,
    required this.profilePic,
    required this.bannerPic,
    required this.isTwitterBlue,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    List<String>? followers,
    List<String>? followings,
    String? bio,
    String? profilePic,
    String? bannerPic,
    bool? isTwitterBlue,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      followers: followers ?? this.followers,
      followings: followings ?? this.followings,
      bio: bio ?? this.bio,
      profilePic: profilePic ?? this.profilePic,
      bannerPic: bannerPic ?? this.bannerPic,
      isTwitterBlue: isTwitterBlue ?? this.isTwitterBlue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'followers': followers,
      'followings': followings,
      'bio': bio,
      'profilePic': profilePic,
      'bannerPic': bannerPic,
      'isTwitterBlue': isTwitterBlue,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      followers: List<String>.from(map['followers']),
      followings: List<String>.from(map['followings']),
      bio: map['bio'] ?? '',
      profilePic: map['profilePic'] ?? '',
      bannerPic: map['bannerPic'] ?? '',
      isTwitterBlue: map['isTwitterBlue'] ?? false,
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, name: $name, followers: $followers, followings: $followings, bio: $bio, profilePic: $profilePic, bannerPic: $bannerPic, isTwitterBlue: $isTwitterBlue)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.uid == uid &&
        other.email == email &&
        other.name == name &&
        listEquals(other.followers, followers) &&
        listEquals(other.followings, followings) &&
        other.bio == bio &&
        other.profilePic == profilePic &&
        other.bannerPic == bannerPic &&
        other.isTwitterBlue == isTwitterBlue;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        email.hashCode ^
        name.hashCode ^
        followers.hashCode ^
        followings.hashCode ^
        bio.hashCode ^
        profilePic.hashCode ^
        bannerPic.hashCode ^
        isTwitterBlue.hashCode;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome`
  String get welcomeMsg {
    return Intl.message(
      'Welcome',
      name: 'welcomeMsg',
      desc: '',
      args: [],
    );
  }

  /// `Like`
  String get like {
    return Intl.message(
      'Like',
      name: 'like',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get posts {
    return Intl.message(
      'Posts',
      name: 'posts',
      desc: '',
      args: [],
    );
  }

  /// `Create a new post`
  String get createNewPost {
    return Intl.message(
      'Create a new post',
      name: 'createNewPost',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Advices`
  String get advices {
    return Intl.message(
      'Advices',
      name: 'advices',
      desc: '',
      args: [],
    );
  }

  /// `Reminders`
  String get reminders {
    return Intl.message(
      'Reminders',
      name: 'reminders',
      desc: '',
      args: [],
    );
  }

  /// `Medical Record`
  String get medicalRecord {
    return Intl.message(
      'Medical Record',
      name: 'medicalRecord',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get post {
    return Intl.message(
      'Post',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Search Record`
  String get searchRecord {
    return Intl.message(
      'Search Record',
      name: 'searchRecord',
      desc: '',
      args: [],
    );
  }

  /// `Mohamed Hamed`
  String get mohamedHamed {
    return Intl.message(
      'Mohamed Hamed',
      name: 'mohamedHamed',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personal_info {
    return Intl.message(
      'Personal Information',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Practical Experience`
  String get practicalExperience {
    return Intl.message(
      'Practical Experience',
      name: 'practicalExperience',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Edit Personal Information`
  String get editUserInformation {
    return Intl.message(
      'Edit Personal Information',
      name: 'editUserInformation',
      desc: '',
      args: [],
    );
  }

  /// `Post Content........`
  String get postContent {
    return Intl.message(
      'Post Content........',
      name: 'postContent',
      desc: '',
      args: [],
    );
  }

  /// `Create Post`
  String get createPost {
    return Intl.message(
      'Create Post',
      name: 'createPost',
      desc: '',
      args: [],
    );
  }

  /// `Edit Post`
  String get editPost {
    return Intl.message(
      'Edit Post',
      name: 'editPost',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

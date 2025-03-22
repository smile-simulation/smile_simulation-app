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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `A comprehensive forum that helps you discover medical tips and professional answers in one place.\nGet support and advice from dental experts and fellow patients with ease.`
  String get onBoarding1 {
    return Intl.message(
      'A comprehensive forum that helps you discover medical tips and professional answers in one place.\nGet support and advice from dental experts and fellow patients with ease.',
      name: 'onBoarding1',
      desc: '',
      args: [],
    );
  }

  /// `All your medical information in one place, from diagnosis to treatment. Track your medical condition step by step.`
  String get onBoarding2 {
    return Intl.message(
      'All your medical information in one place, from diagnosis to treatment. Track your medical condition step by step.',
      name: 'onBoarding2',
      desc: '',
      args: [],
    );
  }

  /// `Everything you need—practical tips to ensure optimal oral and dental health.`
  String get onBoarding3 {
    return Intl.message(
      'Everything you need—practical tips to ensure optimal oral and dental health.',
      name: 'onBoarding3',
      desc: '',
      args: [],
    );
  }

  /// `Managing your time has never been easier. Make your dental health a priority.`
  String get onBoarding4 {
    return Intl.message(
      'Managing your time has never been easier. Make your dental health a priority.',
      name: 'onBoarding4',
      desc: '',
      args: [],
    );
  }

  /// `Fast and secure chat to solve all your oral health-related questions.`
  String get onBoarding5 {
    return Intl.message(
      'Fast and secure chat to solve all your oral health-related questions.',
      name: 'onBoarding5',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Start`
  String get start {
    return Intl.message('Start', name: 'start', desc: '', args: []);
  }

  /// `Welcome`
  String get welcomeMsg {
    return Intl.message('Welcome', name: 'welcomeMsg', desc: '', args: []);
  }

  /// `Like`
  String get like {
    return Intl.message('Like', name: 'like', desc: '', args: []);
  }

  /// `Likes`
  String get likeCount {
    return Intl.message('Likes', name: 'likeCount', desc: '', args: []);
  }

  /// `Comment`
  String get comment {
    return Intl.message('Comment', name: 'comment', desc: '', args: []);
  }

  /// `Comments`
  String get commentCount {
    return Intl.message('Comments', name: 'commentCount', desc: '', args: []);
  }

  /// `Posts`
  String get posts {
    return Intl.message('Posts', name: 'posts', desc: '', args: []);
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
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Advices`
  String get advices {
    return Intl.message('Advices', name: 'advices', desc: '', args: []);
  }

  /// `Reminders`
  String get reminders {
    return Intl.message('Reminders', name: 'reminders', desc: '', args: []);
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
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Post`
  String get post {
    return Intl.message('Post', name: 'post', desc: '', args: []);
  }

  /// `Comments`
  String get comments {
    return Intl.message('Comments', name: 'comments', desc: '', args: []);
  }

  /// `Search History`
  String get searchRecord {
    return Intl.message(
      'Search History',
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
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
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

  /// `Post content........`
  String get postContent {
    return Intl.message(
      'Post content........',
      name: 'postContent',
      desc: '',
      args: [],
    );
  }

  /// `Create Post`
  String get createPost {
    return Intl.message('Create Post', name: 'createPost', desc: '', args: []);
  }

  /// `Edit Post`
  String get editPost {
    return Intl.message('Edit Post', name: 'editPost', desc: '', args: []);
  }

  /// `Publish`
  String get publish {
    return Intl.message('Publish', name: 'publish', desc: '', args: []);
  }

  /// `Save Edits`
  String get saveEdits {
    return Intl.message('Save Edits', name: 'saveEdits', desc: '', args: []);
  }

  /// `Delete Post`
  String get deletePost {
    return Intl.message('Delete Post', name: 'deletePost', desc: '', args: []);
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

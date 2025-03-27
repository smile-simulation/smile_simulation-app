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

  /// `A comprehensive forum that helps you discover medical advice and professional answers in one place.\nGet support and advice from dental experts and fellow patients easily.`
  String get onBoarding1 {
    return Intl.message(
      'A comprehensive forum that helps you discover medical advice and professional answers in one place.\nGet support and advice from dental experts and fellow patients easily.',
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

  /// `Everything you need from practical advice to ensure perfect oral and dental health.`
  String get onBoarding3 {
    return Intl.message(
      'Everything you need from practical advice to ensure perfect oral and dental health.',
      name: 'onBoarding3',
      desc: '',
      args: [],
    );
  }

  /// `Managing your time has become easier. Make your dental health a priority.`
  String get onBoarding4 {
    return Intl.message(
      'Managing your time has become easier. Make your dental health a priority.',
      name: 'onBoarding4',
      desc: '',
      args: [],
    );
  }

  /// `A fast and secure chat to solve all your oral health-related questions.`
  String get onBoarding5 {
    return Intl.message(
      'A fast and secure chat to solve all your oral health-related questions.',
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

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get noAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register now`
  String get registerNow {
    return Intl.message(
      'Register now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back! Log in to continue`
  String get welcomeBack {
    return Intl.message(
      'Welcome back! Log in to continue',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message('Sign in', name: 'signIn', desc: '', args: []);
  }

  /// `Sign in with`
  String get signInWith {
    return Intl.message('Sign in with', name: 'signInWith', desc: '', args: []);
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

  /// `Verification code`
  String get verificationCode {
    return Intl.message(
      'Verification code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember password?`
  String get rememberPassword {
    return Intl.message(
      'Remember password?',
      name: 'rememberPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the email address registered with your account to send the code.`
  String get enterEmail {
    return Intl.message(
      'Please enter the email address registered with your account to send the code.',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 6-digit verification code sent to you.`
  String get enterVerificationCode {
    return Intl.message(
      'Please enter the 6-digit verification code sent to you.',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new password consisting of 8 letters and numbers.`
  String get enterNewPassword {
    return Intl.message(
      'Please enter a new password consisting of 8 letters and numbers.',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Register as a doctor`
  String get registerAsDoctor {
    return Intl.message(
      'Register as a doctor',
      name: 'registerAsDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Register as a user`
  String get registerAsUser {
    return Intl.message(
      'Register as a user',
      name: 'registerAsUser',
      desc: '',
      args: [],
    );
  }

  /// `Enter your personal information`
  String get enterPersonalInfo {
    return Intl.message(
      'Enter your personal information',
      name: 'enterPersonalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Academic certificate`
  String get academicCertificate {
    return Intl.message(
      'Academic certificate',
      name: 'academicCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Specialization`
  String get specialization {
    return Intl.message(
      'Specialization',
      name: 'specialization',
      desc: '',
      args: [],
    );
  }

  /// `Years of experience`
  String get yearsOfExperience {
    return Intl.message(
      'Years of experience',
      name: 'yearsOfExperience',
      desc: '',
      args: [],
    );
  }

  /// `Save data`
  String get saveData {
    return Intl.message('Save data', name: 'saveData', desc: '', args: []);
  }

  /// `Full name`
  String get fullName {
    return Intl.message('Full name', name: 'fullName', desc: '', args: []);
  }

  /// `Upload your ID card`
  String get uploadIDCard {
    return Intl.message(
      'Upload your ID card',
      name: 'uploadIDCard',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
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

  /// `Medical record`
  String get medicalRecord {
    return Intl.message(
      'Medical record',
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

  /// `Search history`
  String get searchRecord {
    return Intl.message(
      'Search history',
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

  /// `Personal information`
  String get personal_info {
    return Intl.message(
      'Personal information',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Practical experience`
  String get practicalExperience {
    return Intl.message(
      'Practical experience',
      name: 'practicalExperience',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Date of birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Edit personal information`
  String get editUserInformation {
    return Intl.message(
      'Edit personal information',
      name: 'editUserInformation',
      desc: '',
      args: [],
    );
  }

  /// `Post content...`
  String get postContent {
    return Intl.message(
      'Post content...',
      name: 'postContent',
      desc: '',
      args: [],
    );
  }

  /// `Create post`
  String get createPost {
    return Intl.message('Create post', name: 'createPost', desc: '', args: []);
  }

  /// `Edit post`
  String get editPost {
    return Intl.message('Edit post', name: 'editPost', desc: '', args: []);
  }

  /// `Publish`
  String get publish {
    return Intl.message('Publish', name: 'publish', desc: '', args: []);
  }

  /// `Save edits`
  String get saveEdits {
    return Intl.message('Save edits', name: 'saveEdits', desc: '', args: []);
  }

  /// `Delete post`
  String get deletePost {
    return Intl.message('Delete post', name: 'deletePost', desc: '', args: []);
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

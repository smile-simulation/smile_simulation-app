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
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
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

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with`
  String get signInWith {
    return Intl.message(
      'Sign in with',
      name: 'signInWith',
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
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Save data',
      name: 'saveData',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
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

  /// `Likes`
  String get likeCount {
    return Intl.message(
      'Likes',
      name: 'likeCount',
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

  /// `Comments`
  String get commentCount {
    return Intl.message(
      'Comments',
      name: 'commentCount',
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
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
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

  /// `Create new post`
  String get createPost {
    return Intl.message(
      'Create new post',
      name: 'createPost',
      desc: '',
      args: [],
    );
  }

  /// `Edit post`
  String get editPost {
    return Intl.message(
      'Edit post',
      name: 'editPost',
      desc: '',
      args: [],
    );
  }

  /// `Publish`
  String get publish {
    return Intl.message(
      'Publish',
      name: 'publish',
      desc: '',
      args: [],
    );
  }

  /// `Save edits`
  String get saveEdits {
    return Intl.message(
      'Save edits',
      name: 'saveEdits',
      desc: '',
      args: [],
    );
  }

  /// `Delete post`
  String get deletePost {
    return Intl.message(
      'Delete post',
      name: 'deletePost',
      desc: '',
      args: [],
    );
  }

  /// `Today's Advice`
  String get toDaysAdvice {
    return Intl.message(
      'Today\'s Advice',
      name: 'toDaysAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Advice categories`
  String get advicesCategories {
    return Intl.message(
      'Advice categories',
      name: 'advicesCategories',
      desc: '',
      args: [],
    );
  }

  /// `General Advices`
  String get generalAdvices {
    return Intl.message(
      'General Advices',
      name: 'generalAdvices',
      desc: '',
      args: [],
    );
  }

  /// `Show All`
  String get showAll {
    return Intl.message(
      'Show All',
      name: 'showAll',
      desc: '',
      args: [],
    );
  }

  /// `Image Not Valid`
  String get imageError {
    return Intl.message(
      'Image Not Valid',
      name: 'imageError',
      desc: '',
      args: [],
    );
  }

  /// `Advice Title Not Valid`
  String get adviceTitleError {
    return Intl.message(
      'Advice Title Not Valid',
      name: 'adviceTitleError',
      desc: '',
      args: [],
    );
  }

  /// `Advice Content Not Valid`
  String get adviceContentError {
    return Intl.message(
      'Advice Content Not Valid',
      name: 'adviceContentError',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `No advices exist`
  String get noAdvicesExist {
    return Intl.message(
      'No advices exist',
      name: 'noAdvicesExist',
      desc: '',
      args: [],
    );
  }

  /// `No categories of advices currently exist`
  String get noCategoriesAdvicesExist {
    return Intl.message(
      'No categories of advices currently exist',
      name: 'noCategoriesAdvicesExist',
      desc: '',
      args: [],
    );
  }

  /// `Smile Chat`
  String get smileChat {
    return Intl.message(
      'Smile Chat',
      name: 'smileChat',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Reminder`
  String get medicineReminder {
    return Intl.message(
      'Medicine Reminder',
      name: 'medicineReminder',
      desc: '',
      args: [],
    );
  }

  /// `Visit Schedules`
  String get visitSchedules {
    return Intl.message(
      'Visit Schedules',
      name: 'visitSchedules',
      desc: '',
      args: [],
    );
  }

  /// `Daily Activities`
  String get dailyActivities {
    return Intl.message(
      'Daily Activities',
      name: 'dailyActivities',
      desc: '',
      args: [],
    );
  }

  /// `Other Tasks`
  String get otherTasks {
    return Intl.message(
      'Other Tasks',
      name: 'otherTasks',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Reminders`
  String get medicineReminders {
    return Intl.message(
      'Medicine Reminders',
      name: 'medicineReminders',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Add New Reminder`
  String get addReminder {
    return Intl.message(
      'Add New Reminder',
      name: 'addReminder',
      desc: '',
      args: [],
    );
  }

  /// `Add New Medicine`
  String get addMedicine {
    return Intl.message(
      'Add New Medicine',
      name: 'addMedicine',
      desc: '',
      args: [],
    );
  }

  /// `Add the medicines you use to your medical reminders so we can remind you at their specified times`
  String get addMedicineInstruction {
    return Intl.message(
      'Add the medicines you use to your medical reminders so we can remind you at their specified times',
      name: 'addMedicineInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Before Meal`
  String get beforeMeal {
    return Intl.message(
      'Before Meal',
      name: 'beforeMeal',
      desc: '',
      args: [],
    );
  }

  /// `After Meal`
  String get afterMeal {
    return Intl.message(
      'After Meal',
      name: 'afterMeal',
      desc: '',
      args: [],
    );
  }

  /// `During Meal`
  String get duringMeal {
    return Intl.message(
      'During Meal',
      name: 'duringMeal',
      desc: '',
      args: [],
    );
  }

  /// `Add Medicine`
  String get addMedicineButton {
    return Intl.message(
      'Add Medicine',
      name: 'addMedicineButton',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Name`
  String get medicineName {
    return Intl.message(
      'Medicine Name',
      name: 'medicineName',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Time`
  String get medicineTime {
    return Intl.message(
      'Medicine Time',
      name: 'medicineTime',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Frequency`
  String get frequency {
    return Intl.message(
      'Frequency',
      name: 'frequency',
      desc: '',
      args: [],
    );
  }

  /// `Spoon`
  String get spoon {
    return Intl.message(
      'Spoon',
      name: 'spoon',
      desc: '',
      args: [],
    );
  }

  /// `Pill`
  String get pill {
    return Intl.message(
      'Pill',
      name: 'pill',
      desc: '',
      args: [],
    );
  }

  /// `Half Pill`
  String get halfPill {
    return Intl.message(
      'Half Pill',
      name: 'halfPill',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Stop Date`
  String get stopDate {
    return Intl.message(
      'Medicine Stop Date',
      name: 'stopDate',
      desc: '',
      args: [],
    );
  }

  /// `Permanent Medicine`
  String get permanentMedicine {
    return Intl.message(
      'Permanent Medicine',
      name: 'permanentMedicine',
      desc: '',
      args: [],
    );
  }

  /// `Specific Date`
  String get specificDate {
    return Intl.message(
      'Specific Date',
      name: 'specificDate',
      desc: '',
      args: [],
    );
  }

  /// `Add the medicines you take ... and we will remind you of their schedules`
  String get addMedicinePrompt {
    return Intl.message(
      'Add the medicines you take ... and we will remind you of their schedules',
      name: 'addMedicinePrompt',
      desc: '',
      args: [],
    );
  }

  /// `Add the medicines you use to your medical reminders so we can`
  String get addMedicineInstructionPart1 {
    return Intl.message(
      'Add the medicines you use to your medical reminders so we can',
      name: 'addMedicineInstructionPart1',
      desc: '',
      args: [],
    );
  }

  /// `remind you at their specified times`
  String get addMedicineInstructionPart2 {
    return Intl.message(
      'remind you at their specified times',
      name: 'addMedicineInstructionPart2',
      desc: '',
      args: [],
    );
  }

  /// `Delete Medicine`
  String get deleteMedicine {
    return Intl.message(
      'Delete Medicine',
      name: 'deleteMedicine',
      desc: '',
      args: [],
    );
  }

  /// `Add your medical visit ... and we will remind you of its schedule`
  String get addVisitPrompt {
    return Intl.message(
      'Add your medical visit ... and we will remind you of its schedule',
      name: 'addVisitPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Add your medical visits to your reminders so we can`
  String get addVisitInstructionPart1 {
    return Intl.message(
      'Add your medical visits to your reminders so we can',
      name: 'addVisitInstructionPart1',
      desc: '',
      args: [],
    );
  }

  /// `remind you at their specified times`
  String get addVisitInstructionPart2 {
    return Intl.message(
      'remind you at their specified times',
      name: 'addVisitInstructionPart2',
      desc: '',
      args: [],
    );
  }

  /// `Add your medical visit schedules so we can remind you at their specified times.`
  String get addVisitSchedulesInstruction {
    return Intl.message(
      'Add your medical visit schedules so we can remind you at their specified times.',
      name: 'addVisitSchedulesInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Visit Name`
  String get visitName {
    return Intl.message(
      'Visit Name',
      name: 'visitName',
      desc: '',
      args: [],
    );
  }

  /// `Visit Address`
  String get visitAddress {
    return Intl.message(
      'Visit Address',
      name: 'visitAddress',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Add your daily activities ... and we will remind you of their schedules`
  String get addDailyActivitiesPrompt {
    return Intl.message(
      'Add your daily activities ... and we will remind you of their schedules',
      name: 'addDailyActivitiesPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Add your daily activities to your reminders so we can`
  String get addDailyActivitiesInstructionPart1 {
    return Intl.message(
      'Add your daily activities to your reminders so we can',
      name: 'addDailyActivitiesInstructionPart1',
      desc: '',
      args: [],
    );
  }

  /// `remind you at their specified times`
  String get addDailyActivitiesInstructionPart2 {
    return Intl.message(
      'remind you at their specified times',
      name: 'addDailyActivitiesInstructionPart2',
      desc: '',
      args: [],
    );
  }

  /// `Add First Reminder`
  String get addFirstReminder {
    return Intl.message(
      'Add First Reminder',
      name: 'addFirstReminder',
      desc: '',
      args: [],
    );
  }

  /// `Add New Reminder`
  String get addNewReminder {
    return Intl.message(
      'Add New Reminder',
      name: 'addNewReminder',
      desc: '',
      args: [],
    );
  }

  /// `Add your special tasks ... and we will remind you of their schedules`
  String get addSpecialTasksPrompt {
    return Intl.message(
      'Add your special tasks ... and we will remind you of their schedules',
      name: 'addSpecialTasksPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Add your special tasks to your reminders so we can`
  String get addSpecialTasksInstructionPart1 {
    return Intl.message(
      'Add your special tasks to your reminders so we can',
      name: 'addSpecialTasksInstructionPart1',
      desc: '',
      args: [],
    );
  }

  /// `remind you at their specified times`
  String get addSpecialTasksInstructionPart2 {
    return Intl.message(
      'remind you at their specified times',
      name: 'addSpecialTasksInstructionPart2',
      desc: '',
      args: [],
    );
  }

  /// `About the App`
  String get aboutApp {
    return Intl.message(
      'About the App',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Rate the App`
  String get rateApp {
    return Intl.message(
      'Rate the App',
      name: 'rateApp',
      desc: '',
      args: [],
    );
  }

  /// `Share the App`
  String get shareApp {
    return Intl.message(
      'Share the App',
      name: 'shareApp',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logoutConfirmation {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Logged out successfully`
  String get logoutSuccess {
    return Intl.message(
      'Logged out successfully',
      name: 'logoutSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Edit Personal Information`
  String get editPersonalInfo {
    return Intl.message(
      'Edit Personal Information',
      name: 'editPersonalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmDialogTitle {
    return Intl.message(
      'Confirm',
      name: 'confirmDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the account?`
  String get deleteAccountConfirmation {
    return Intl.message(
      'Are you sure you want to delete the account?',
      name: 'deleteAccountConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
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

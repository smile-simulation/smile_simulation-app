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

  /// `⚠️ Smile Simulation is an educational AI simulation app and is not a substitute for real medical care.`
  String get onBoarding6 {
    return Intl.message(
      '⚠️ Smile Simulation is an educational AI simulation app and is not a substitute for real medical care.',
      name: 'onBoarding6',
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

  /// `Bachelor's`
  String get degree_bachelor {
    return Intl.message(
      'Bachelor\'s',
      name: 'degree_bachelor',
      desc: '',
      args: [],
    );
  }

  /// `Master's`
  String get degree_master {
    return Intl.message(
      'Master\'s',
      name: 'degree_master',
      desc: '',
      args: [],
    );
  }

  /// `PhD`
  String get degree_phd {
    return Intl.message(
      'PhD',
      name: 'degree_phd',
      desc: '',
      args: [],
    );
  }

  /// `Dentistry`
  String get degree_dentistry {
    return Intl.message(
      'Dentistry',
      name: 'degree_dentistry',
      desc: '',
      args: [],
    );
  }

  /// `Orthodontics`
  String get degree_orthodontics {
    return Intl.message(
      'Orthodontics',
      name: 'degree_orthodontics',
      desc: '',
      args: [],
    );
  }

  /// `Oral Surgery`
  String get degree_oral_surgery {
    return Intl.message(
      'Oral Surgery',
      name: 'degree_oral_surgery',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
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

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
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

  /// `No Posts Exist`
  String get noPostsExist {
    return Intl.message(
      'No Posts Exist',
      name: 'noPostsExist',
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

  /// `About the Account`
  String get aboutAccount {
    return Intl.message(
      'About the Account',
      name: 'aboutAccount',
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

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `You are about to change your password. Please enter a new password.`
  String get changePasswordPrompt {
    return Intl.message(
      'You are about to change your password. Please enter a new password.',
      name: 'changePasswordPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you are agreeing to our `
  String get agreeToTermsPrefix {
    return Intl.message(
      'By creating an account, you are agreeing to our ',
      name: 'agreeToTermsPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Agree to Privacy Policy and Terms & Conditions`
  String get agreeToTermsAndPrivacy {
    return Intl.message(
      'Agree to Privacy Policy and Terms & Conditions',
      name: 'agreeToTermsAndPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Please agree to the Privacy Policy and Terms & Conditions`
  String get pleaseAgreeToTermsAndPrivacy {
    return Intl.message(
      'Please agree to the Privacy Policy and Terms & Conditions',
      name: 'pleaseAgreeToTermsAndPrivacy',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get and {
    return Intl.message(
      ' and ',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Personal Data`
  String get personalData {
    return Intl.message(
      'Personal Data',
      name: 'personalData',
      desc: '',
      args: [],
    );
  }

  /// `Health Status`
  String get healthStatus {
    return Intl.message(
      'Health Status',
      name: 'healthStatus',
      desc: '',
      args: [],
    );
  }

  /// `Treatment History`
  String get treatmentHistory {
    return Intl.message(
      'Treatment History',
      name: 'treatmentHistory',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the email`
  String get email_empty {
    return Intl.message(
      'Please enter the email',
      name: 'email_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get email_invalid {
    return Intl.message(
      'Please enter a valid email',
      name: 'email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get password_empty {
    return Intl.message(
      'Password is required',
      name: 'password_empty',
      desc: '',
      args: [],
    );
  }

  /// `Must contain at least one uppercase letter [A-Z]`
  String get password_uppercase {
    return Intl.message(
      'Must contain at least one uppercase letter [A-Z]',
      name: 'password_uppercase',
      desc: '',
      args: [],
    );
  }

  /// `Must contain at least one lowercase letter [a-z]`
  String get password_lowercase {
    return Intl.message(
      'Must contain at least one lowercase letter [a-z]',
      name: 'password_lowercase',
      desc: '',
      args: [],
    );
  }

  /// `Must contain at least one number [0-9]`
  String get password_number {
    return Intl.message(
      'Must contain at least one number [0-9]',
      name: 'password_number',
      desc: '',
      args: [],
    );
  }

  /// `Must contain at least one special character [@-#-..]`
  String get password_special {
    return Intl.message(
      'Must contain at least one special character [@-#-..]',
      name: 'password_special',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least 8 characters`
  String get password_min_length {
    return Intl.message(
      'Must be at least 8 characters',
      name: 'password_min_length',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the name`
  String get name_empty {
    return Intl.message(
      'Please enter the name',
      name: 'name_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the full name`
  String get name_full {
    return Intl.message(
      'Please enter the full name',
      name: 'name_full',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid name`
  String get name_valid {
    return Intl.message(
      'Enter a valid name',
      name: 'name_valid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the age`
  String get age_empty {
    return Intl.message(
      'Please enter the age',
      name: 'age_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid age number`
  String get age_valid {
    return Intl.message(
      'Please enter a valid age number',
      name: 'age_valid',
      desc: '',
      args: [],
    );
  }

  /// `Age must be 12 years or more`
  String get age_min {
    return Intl.message(
      'Age must be 12 years or more',
      name: 'age_min',
      desc: '',
      args: [],
    );
  }

  /// `Age must be 70 years or less`
  String get age_max {
    return Intl.message(
      'Age must be 70 years or less',
      name: 'age_max',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the address`
  String get address_empty {
    return Intl.message(
      'Please enter the address',
      name: 'address_empty',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid address`
  String get address_valid {
    return Intl.message(
      'Enter a valid address',
      name: 'address_valid',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get phone_empty {
    return Intl.message(
      'Enter phone number',
      name: 'phone_empty',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get phone_valid {
    return Intl.message(
      'Enter a valid phone number',
      name: 'phone_valid',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get phone_valid2 {
    return Intl.message(
      'Enter a valid phone number',
      name: 'phone_valid2',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get field_required {
    return Intl.message(
      'This field is required',
      name: 'field_required',
      desc: '',
      args: [],
    );
  }

  /// `Job Title`
  String get job_title {
    return Intl.message(
      'Job Title',
      name: 'job_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter Job`
  String get enter_job {
    return Intl.message(
      'Enter Job',
      name: 'enter_job',
      desc: '',
      args: [],
    );
  }

  /// `Marital Status`
  String get marital_status {
    return Intl.message(
      'Marital Status',
      name: 'marital_status',
      desc: '',
      args: [],
    );
  }

  /// `Single`
  String get single {
    return Intl.message(
      'Single',
      name: 'single',
      desc: '',
      args: [],
    );
  }

  /// `Married`
  String get married {
    return Intl.message(
      'Married',
      name: 'married',
      desc: '',
      args: [],
    );
  }

  /// `Enter Age`
  String get enter_age {
    return Intl.message(
      'Enter Age',
      name: 'enter_age',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `An Error Occurred, Try Again`
  String get error_try_again {
    return Intl.message(
      'An Error Occurred, Try Again',
      name: 'error_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Data Updated Successfully`
  String get data_updated_success {
    return Intl.message(
      'Data Updated Successfully',
      name: 'data_updated_success',
      desc: '',
      args: [],
    );
  }

  /// `Do you suffer from any chronic diseases?`
  String get chronic_diseases_question {
    return Intl.message(
      'Do you suffer from any chronic diseases?',
      name: 'chronic_diseases_question',
      desc: '',
      args: [],
    );
  }

  /// `Hypertension`
  String get hypertension {
    return Intl.message(
      'Hypertension',
      name: 'hypertension',
      desc: '',
      args: [],
    );
  }

  /// `Diabetes`
  String get diabetes {
    return Intl.message(
      'Diabetes',
      name: 'diabetes',
      desc: '',
      args: [],
    );
  }

  /// `Hepatitis A,B,C`
  String get hepatitis {
    return Intl.message(
      'Hepatitis A,B,C',
      name: 'hepatitis',
      desc: '',
      args: [],
    );
  }

  /// `Heart Disease`
  String get heart_disease {
    return Intl.message(
      'Heart Disease',
      name: 'heart_disease',
      desc: '',
      args: [],
    );
  }

  /// `Anemia`
  String get anemia {
    return Intl.message(
      'Anemia',
      name: 'anemia',
      desc: '',
      args: [],
    );
  }

  /// `Thyroid Disease`
  String get thyroid_disease {
    return Intl.message(
      'Thyroid Disease',
      name: 'thyroid_disease',
      desc: '',
      args: [],
    );
  }

  /// `Kidney Disease`
  String get kidney_disease {
    return Intl.message(
      'Kidney Disease',
      name: 'kidney_disease',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other_diseases {
    return Intl.message(
      'Other',
      name: 'other_diseases',
      desc: '',
      args: [],
    );
  }

  /// `Write here...`
  String get write_here {
    return Intl.message(
      'Write here...',
      name: 'write_here',
      desc: '',
      args: [],
    );
  }

  /// `Do you have any allergies to medications or medical substances?`
  String get drug_allergy_question {
    return Intl.message(
      'Do you have any allergies to medications or medical substances?',
      name: 'drug_allergy_question',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Have you undergone any previous surgeries?`
  String get surgery_question {
    return Intl.message(
      'Have you undergone any previous surgeries?',
      name: 'surgery_question',
      desc: '',
      args: [],
    );
  }

  /// `Are you a smoker?`
  String get smoking_question {
    return Intl.message(
      'Are you a smoker?',
      name: 'smoking_question',
      desc: '',
      args: [],
    );
  }

  /// `Are there any pregnancy or breastfeeding conditions?`
  String get pregnancy_question {
    return Intl.message(
      'Are there any pregnancy or breastfeeding conditions?',
      name: 'pregnancy_question',
      desc: '',
      args: [],
    );
  }

  /// `Pregnant`
  String get pregnant {
    return Intl.message(
      'Pregnant',
      name: 'pregnant',
      desc: '',
      args: [],
    );
  }

  /// `Breastfeeding`
  String get breastfeeding {
    return Intl.message(
      'Breastfeeding',
      name: 'breastfeeding',
      desc: '',
      args: [],
    );
  }

  /// `Not Applicable`
  String get not_applicable {
    return Intl.message(
      'Not Applicable',
      name: 'not_applicable',
      desc: '',
      args: [],
    );
  }

  /// `Is there a family history of the disease?`
  String get family_history_question {
    return Intl.message(
      'Is there a family history of the disease?',
      name: 'family_history_question',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a description of other diseases`
  String get other_diseases_description_error {
    return Intl.message(
      'Please enter a description of other diseases',
      name: 'other_diseases_description_error',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the medication allergy`
  String get drug_allergy_error {
    return Intl.message(
      'Please enter the medication allergy',
      name: 'drug_allergy_error',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get comingSoon {
    return Intl.message(
      'Coming Soon',
      name: 'comingSoon',
      desc: '',
      args: [],
    );
  }

  /// `This feature is coming soon`
  String get thisFeatureIsComingSoon {
    return Intl.message(
      'This feature is coming soon',
      name: 'thisFeatureIsComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Write Some Thing`
  String get writeSomething {
    return Intl.message(
      'Write Some Thing',
      name: 'writeSomething',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get no_internet_title {
    return Intl.message(
      'No internet connection',
      name: 'no_internet_title',
      desc: '',
      args: [],
    );
  }

  /// `Please check your connection for Smile Simulation`
  String get no_internet_description {
    return Intl.message(
      'Please check your connection for Smile Simulation',
      name: 'no_internet_description',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get retry {
    return Intl.message(
      'Try again',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Loading Posts Error`
  String get loadingPostsError {
    return Intl.message(
      'Loading Posts Error',
      name: 'loadingPostsError',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Smile Simulation`
  String get appName {
    return Intl.message(
      'Smile Simulation',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Smile Simulation is a mobile application developed as part of a graduation project by a group of Computer Science students at the Faculty of Computers and Artificial Intelligence.`
  String get aboutUsDescription1 {
    return Intl.message(
      'Smile Simulation is a mobile application developed as part of a graduation project by a group of Computer Science students at the Faculty of Computers and Artificial Intelligence.',
      name: 'aboutUsDescription1',
      desc: '',
      args: [],
    );
  }

  /// `The app is created to explore how modern technologies can support oral health education in an interactive way. It is for educational purposes only.`
  String get aboutUsDescription2 {
    return Intl.message(
      'The app is created to explore how modern technologies can support oral health education in an interactive way. It is for educational purposes only.',
      name: 'aboutUsDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Important Notice`
  String get aboutUsWarningTitle {
    return Intl.message(
      'Important Notice',
      name: 'aboutUsWarningTitle',
      desc: '',
      args: [],
    );
  }

  /// `This app does not provide real medical advice or diagnosis. It is a simulated educational tool and should not be used as a substitute for real dental care.`
  String get aboutUsWarningText {
    return Intl.message(
      'This app does not provide real medical advice or diagnosis. It is a simulated educational tool and should not be used as a substitute for real dental care.',
      name: 'aboutUsWarningText',
      desc: '',
      args: [],
    );
  }

  /// `Developed by:`
  String get aboutUsDevelopedBy {
    return Intl.message(
      'Developed by:',
      name: 'aboutUsDevelopedBy',
      desc: '',
      args: [],
    );
  }

  /// `Faculty of Computers and Artificial Intelligence`
  String get aboutUsFaculty {
    return Intl.message(
      'Faculty of Computers and Artificial Intelligence',
      name: 'aboutUsFaculty',
      desc: '',
      args: [],
    );
  }

  /// `Graduation Year: 2025`
  String get aboutUsGraduationYear {
    return Intl.message(
      'Graduation Year: 2025',
      name: 'aboutUsGraduationYear',
      desc: '',
      args: [],
    );
  }

  /// `Project Supervisor: Dr. Ahmed Younis`
  String get aboutUsSupervisor {
    return Intl.message(
      'Project Supervisor: Dr. Ahmed Younis',
      name: 'aboutUsSupervisor',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us:`
  String get aboutUsContact {
    return Intl.message(
      'Contact Us:',
      name: 'aboutUsContact',
      desc: '',
      args: [],
    );
  }

  /// `MahmoudMagdy176203@gmail.com`
  String get aboutUsEmail {
    return Intl.message(
      'MahmoudMagdy176203@gmail.com',
      name: 'aboutUsEmail',
      desc: '',
      args: [],
    );
  }

  /// `Team Members`
  String get aboutUsTeamTitle {
    return Intl.message(
      'Team Members',
      name: 'aboutUsTeamTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mahmoud Magdy Zaghloul – Team Leader & Flutter Developer`
  String get teamMahmoud {
    return Intl.message(
      'Mahmoud Magdy Zaghloul – Team Leader & Flutter Developer',
      name: 'teamMahmoud',
      desc: '',
      args: [],
    );
  }

  /// `• Project coordination, progress monitoring, and UI development using Flutter.`
  String get teamMahmoudRole {
    return Intl.message(
      '• Project coordination, progress monitoring, and UI development using Flutter.',
      name: 'teamMahmoudRole',
      desc: '',
      args: [],
    );
  }

  /// `Hanan Fawzy Mahmoud – UI/UX Designer`
  String get teamHanan {
    return Intl.message(
      'Hanan Fawzy Mahmoud – UI/UX Designer',
      name: 'teamHanan',
      desc: '',
      args: [],
    );
  }

  /// `• Designing user-friendly interfaces that align with project goals and user needs.`
  String get teamHananRole {
    return Intl.message(
      '• Designing user-friendly interfaces that align with project goals and user needs.',
      name: 'teamHananRole',
      desc: '',
      args: [],
    );
  }

  /// `Mohamed Roshdy Ibrahim – Flutter Developer`
  String get teamMohamedRoshdy {
    return Intl.message(
      'Mohamed Roshdy Ibrahim – Flutter Developer',
      name: 'teamMohamedRoshdy',
      desc: '',
      args: [],
    );
  }

  /// `Mohamed Hamed – Flutter Developer`
  String get teamMohamedHamed {
    return Intl.message(
      'Mohamed Hamed – Flutter Developer',
      name: 'teamMohamedHamed',
      desc: '',
      args: [],
    );
  }

  /// `• Frontend development, performance optimization, and usability testing.`
  String get teamFrontendRole {
    return Intl.message(
      '• Frontend development, performance optimization, and usability testing.',
      name: 'teamFrontendRole',
      desc: '',
      args: [],
    );
  }

  /// `Mostafa Abu Humaid Mahmoud Ahmed – Backend Developer (.NET & SQL)`
  String get teamMostafa {
    return Intl.message(
      'Mostafa Abu Humaid Mahmoud Ahmed – Backend Developer (.NET & SQL)',
      name: 'teamMostafa',
      desc: '',
      args: [],
    );
  }

  /// `Fatma Al-Zahraa Osama Ahmed – Backend Developer (.NET & SQL)`
  String get teamFatma {
    return Intl.message(
      'Fatma Al-Zahraa Osama Ahmed – Backend Developer (.NET & SQL)',
      name: 'teamFatma',
      desc: '',
      args: [],
    );
  }

  /// `• API creation, database design, and server management for stability and security.`
  String get teamBackendRole {
    return Intl.message(
      '• API creation, database design, and server management for stability and security.',
      name: 'teamBackendRole',
      desc: '',
      args: [],
    );
  }

  /// `Baher Hamada Abdel-Raouf – AI Chat Developer`
  String get teamBaher {
    return Intl.message(
      'Baher Hamada Abdel-Raouf – AI Chat Developer',
      name: 'teamBaher',
      desc: '',
      args: [],
    );
  }

  /// `Asmaa Esmat Qassem – AI Chat Developer`
  String get teamAsmaa {
    return Intl.message(
      'Asmaa Esmat Qassem – AI Chat Developer',
      name: 'teamAsmaa',
      desc: '',
      args: [],
    );
  }

  /// `• AI chat integration using OLLAMA, LangChain, and prompt engineering.`
  String get teamAIChatRole {
    return Intl.message(
      '• AI chat integration using OLLAMA, LangChain, and prompt engineering.',
      name: 'teamAIChatRole',
      desc: '',
      args: [],
    );
  }

  /// `Enter the Patient ID`
  String get patientIdPlaceholder {
    return Intl.message(
      'Enter the Patient ID',
      name: 'patientIdPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Enter the Patient ID to view the full medical record.`
  String get patientIdHint {
    return Intl.message(
      'Enter the Patient ID to view the full medical record.',
      name: 'patientIdHint',
      desc: '',
      args: [],
    );
  }

  /// `Not Valid Date of birth`
  String get errorDateOfBirth {
    return Intl.message(
      'Not Valid Date of birth',
      name: 'errorDateOfBirth',
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

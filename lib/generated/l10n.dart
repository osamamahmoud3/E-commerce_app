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

  /// `Sign In`
  String get Sign_In {
    return Intl.message(
      'Sign In',
      name: 'Sign_In',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get Sign_Up {
    return Intl.message(
      'Sign Up',
      name: 'Sign_Up',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get Forgot_Password {
    return Intl.message(
      'Forgot Password?',
      name: 'Forgot_Password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `Sign In To Your Account`
  String get Sign_In_To_Your_Account {
    return Intl.message(
      'Sign In To Your Account',
      name: 'Sign_In_To_Your_Account',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Sign In!!!`
  String get Lets_Sign_In {
    return Intl.message(
      'Let’s Sign In!!!',
      name: 'Lets_Sign_In',
      desc: '',
      args: [],
    );
  }

  /// `Email is Required`
  String get email_is_Required {
    return Intl.message(
      'Email is Required',
      name: 'email_is_Required',
      desc: '',
      args: [],
    );
  }

  /// `Enter Correct Email like *****@example.com`
  String get Enter_Correct_Email_like {
    return Intl.message(
      'Enter Correct Email like *****@example.com',
      name: 'Enter_Correct_Email_like',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get Exit {
    return Intl.message(
      'Exit',
      name: 'Exit',
      desc: '',
      args: [],
    );
  }

  /// `UserName`
  String get User_name {
    return Intl.message(
      'UserName',
      name: 'User_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Username`
  String get Enter_Your_Username {
    return Intl.message(
      'Enter Your Username',
      name: 'Enter_Your_Username',
      desc: '',
      args: [],
    );
  }

  /// `Password is Required`
  String get password_is_Required {
    return Intl.message(
      'Password is Required',
      name: 'password_is_Required',
      desc: '',
      args: [],
    );
  }

  /// `Minimum 8 characters`
  String get Minimum_8_characters {
    return Intl.message(
      'Minimum 8 characters',
      name: 'Minimum_8_characters',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get Enter_your_password {
    return Intl.message(
      'Enter your password',
      name: 'Enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Are you haven’t an account?`
  String get Are_you_havent_account {
    return Intl.message(
      'Are you haven’t an account?',
      name: 'Are_you_havent_account',
      desc: '',
      args: [],
    );
  }

  /// `Buy Products`
  String get Buy_Products {
    return Intl.message(
      'Buy Products',
      name: 'Buy_Products',
      desc: '',
      args: [],
    );
  }

  /// `Browse the menu and order directly from the application`
  String get Browse_the_menu_and_order_directly_from_the_application {
    return Intl.message(
      'Browse the menu and order directly from the application',
      name: 'Browse_the_menu_and_order_directly_from_the_application',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `Your order will be immediately collected and delivered`
  String get Your_order_will_be_immediately_collected_and_delivered {
    return Intl.message(
      'Your order will be immediately collected and delivered',
      name: 'Your_order_will_be_immediately_collected_and_delivered',
      desc: '',
      args: [],
    );
  }

  /// `Receive Money`
  String get Receive_Money {
    return Intl.message(
      'Receive Money',
      name: 'Receive_Money',
      desc: '',
      args: [],
    );
  }

  /// `Pick up delivery at your door and enjoy groceries`
  String get Pick_up_delivery_at_your_door_and_enjoy_groceries {
    return Intl.message(
      'Pick up delivery at your door and enjoy groceries',
      name: 'Pick_up_delivery_at_your_door_and_enjoy_groceries',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Here`
  String get Sign_Up_Here {
    return Intl.message(
      'Sign Up Here',
      name: 'Sign_Up_Here',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Create Your Account!!!`
  String get Lets_Create_Your_Account {
    return Intl.message(
      'Let’s Create Your Account!!!',
      name: 'Lets_Create_Your_Account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an Account?`
  String get Already_have_an_Account {
    return Intl.message(
      'Already have an Account?',
      name: 'Already_have_an_Account',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get Enter_Your_Email {
    return Intl.message(
      'Enter Your Email',
      name: 'Enter_Your_Email',
      desc: '',
      args: [],
    );
  }

  /// `Enter Correct Number, Start with 01(0,1,2,5)`
  String get Enter_Correct_Number_like {
    return Intl.message(
      'Enter Correct Number, Start with 01(0,1,2,5)',
      name: 'Enter_Correct_Number_like',
      desc: '',
      args: [],
    );
  }

  /// `Minimum 8 Number`
  String get Minimum_8_Number {
    return Intl.message(
      'Minimum 8 Number',
      name: 'Minimum_8_Number',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get Phone_Number {
    return Intl.message(
      'Phone Number',
      name: 'Phone_Number',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Number`
  String get Enter_Your_Number {
    return Intl.message(
      'Enter Your Number',
      name: 'Enter_Your_Number',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email to reset your password`
  String get Enter_Your_Pssword {
    return Intl.message(
      'Enter Your Email to reset your password',
      name: 'Enter_Your_Pssword',
      desc: '',
      args: [],
    );
  }

  /// `Send Email`
  String get Send_Email {
    return Intl.message(
      'Send Email',
      name: 'Send_Email',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verification_code {
    return Intl.message(
      'Verification Code',
      name: 'verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter the verification code we just sent you on your email address.`
  String
      get Enter_the_verification_code_we_just_sent_you_on_your_email_address {
    return Intl.message(
      'Enter the verification code we just sent you on your email address.',
      name:
          'Enter_the_verification_code_we_just_sent_you_on_your_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get Resend_Code {
    return Intl.message(
      'Resend Code',
      name: 'Resend_Code',
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

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
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

  /// `Cart`
  String get Cart {
    return Intl.message(
      'Cart',
      name: 'Cart',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get Favourite {
    return Intl.message(
      'Favourite',
      name: 'Favourite',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Explore What You \nNeeds...`
  String get Explore_What_You_Needs {
    return Intl.message(
      'Explore What You \nNeeds...',
      name: 'Explore_What_You_Needs',
      desc: '',
      args: [],
    );
  }

  /// `Search what you want.......`
  String get Search_what_you_want {
    return Intl.message(
      'Search what you want.......',
      name: 'Search_what_you_want',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message(
      'Categories',
      name: 'Categories',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get See_All {
    return Intl.message(
      'See All',
      name: 'See_All',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get Products {
    return Intl.message(
      'Products',
      name: 'Products',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get EGP {
    return Intl.message(
      'EGP',
      name: 'EGP',
      desc: '',
      args: [],
    );
  }

  /// `My Shopping Bag`
  String get My_Shopping_Bag {
    return Intl.message(
      'My Shopping Bag',
      name: 'My_Shopping_Bag',
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

  /// `Buy Now`
  String get Buy_Now {
    return Intl.message(
      'Buy Now',
      name: 'Buy_Now',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get Total {
    return Intl.message(
      'Total',
      name: 'Total',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get Favourites {
    return Intl.message(
      'Favourites',
      name: 'Favourites',
      desc: '',
      args: [],
    );
  }

  /// `Modify`
  String get Modify {
    return Intl.message(
      'Modify',
      name: 'Modify',
      desc: '',
      args: [],
    );
  }

  /// `Tap to change your data`
  String get Tap_to_change_your_data {
    return Intl.message(
      'Tap to change your data',
      name: 'Tap_to_change_your_data',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get Change_Password {
    return Intl.message(
      'Change Password',
      name: 'Change_Password',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Automatic`
  String get Automatic {
    return Intl.message(
      'Automatic',
      name: 'Automatic',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get About {
    return Intl.message(
      'About',
      name: 'About',
      desc: '',
      args: [],
    );
  }

  /// `Learn more about Kur E-Shop'App`
  String get Learn_more_about_Kur_EShopApp {
    return Intl.message(
      'Learn more about Kur E-Shop\'App',
      name: 'Learn_more_about_Kur_EShopApp',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get Password_changed_successfully {
    return Intl.message(
      'Password changed successfully',
      name: 'Password_changed_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get Sign_Out {
    return Intl.message(
      'Sign Out',
      name: 'Sign_Out',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to sign out?`
  String get are_you_sure_you_want_to_sign_out {
    return Intl.message(
      'Are you sure you want to sign out?',
      name: 'are_you_sure_you_want_to_sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message(
      'Yes',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get Current_Password {
    return Intl.message(
      'Current Password',
      name: 'Current_Password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Current Password`
  String get Enter_Your_Current_Password {
    return Intl.message(
      'Enter Your Current Password',
      name: 'Enter_Your_Current_Password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get New_Password {
    return Intl.message(
      'New Password',
      name: 'New_Password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your New Password`
  String get Enter_Your_New_Password {
    return Intl.message(
      'Enter Your New Password',
      name: 'Enter_Your_New_Password',
      desc: '',
      args: [],
    );
  }

  /// `Data updated successfully`
  String get Data_updated_successfully {
    return Intl.message(
      'Data updated successfully',
      name: 'Data_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get User_Name {
    return Intl.message(
      'User Name',
      name: 'User_Name',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `Update Data`
  String get Update_Data {
    return Intl.message(
      'Update Data',
      name: 'Update_Data',
      desc: '',
      args: [],
    );
  }

  /// `Address Book`
  String get Address_Book {
    return Intl.message(
      'Address Book',
      name: 'Address_Book',
      desc: '',
      args: [],
    );
  }

  /// `Cash on delivery`
  String get Cash_on_delivery {
    return Intl.message(
      'Cash on delivery',
      name: 'Cash_on_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Online payment`
  String get Online_payment {
    return Intl.message(
      'Online payment',
      name: 'Online_payment',
      desc: '',
      args: [],
    );
  }

  /// `Pick Location from map`
  String get Pick_Location_from_map {
    return Intl.message(
      'Pick Location from map',
      name: 'Pick_Location_from_map',
      desc: '',
      args: [],
    );
  }

  /// `Enter Address Details`
  String get Enter_Address_Details {
    return Intl.message(
      'Enter Address Details',
      name: 'Enter_Address_Details',
      desc: '',
      args: [],
    );
  }

  /// `Your Location`
  String get Your_Location {
    return Intl.message(
      'Your Location',
      name: 'Your_Location',
      desc: '',
      args: [],
    );
  }

  /// `Payment Options`
  String get Payment_Options {
    return Intl.message(
      'Payment Options',
      name: 'Payment_Options',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `Pick Your Location`
  String get Pick_Your_Location {
    return Intl.message(
      'Pick Your Location',
      name: 'Pick_Your_Location',
      desc: '',
      args: [],
    );
  }

  /// `Kur Delivered`
  String get Kur_Delivered {
    return Intl.message(
      'Kur Delivered',
      name: 'Kur_Delivered',
      desc: '',
      args: [],
    );
  }

  /// `Your order will be delivered soon`
  String get Your_order_will_be_delivered_soon {
    return Intl.message(
      'Your order will be delivered soon',
      name: 'Your_order_will_be_delivered_soon',
      desc: '',
      args: [],
    );
  }

  /// `15 min`
  String get minutes {
    return Intl.message(
      '15 min',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Back To Home`
  String get back_to_home {
    return Intl.message(
      'Back To Home',
      name: 'back_to_home',
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

/// Time Utils
String formatTimestampAgo(int timestamp) =>
    timeago.format(DateTime.fromMillisecondsSinceEpoch(timestamp)).toString();

/// Shapes
final ShapeBorder kDialogShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(kSpacingLarge)),
);

/// Decorations
final BoxDecoration kCurvedBackground = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(kSpacingXXLarge),
    topRight: Radius.circular(kSpacingXXLarge),
  ),
);
final BoxDecoration kColoredDecoration = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(kSpacingXXLarge),
    topRight: Radius.circular(kSpacingXXLarge),
  ),
  color: kPrimaryColorVariant.withOpacity(kNoOpacity),
);

/// Fonts
final kDefaultFontFamily = GoogleFonts.montserratAlternates().fontFamily;
final kSecondaryFontFamily = GoogleFonts.rubik().fontFamily;

/// Animation Duration
const Duration kAnimationDuration = const Duration(milliseconds: 500);
const Duration kSliderDuration = const Duration(milliseconds: 1500);
const Duration kDummyDuration = const Duration(milliseconds: 2500);

/// Colors
const Color kDarkPrimaryColor = Color(0xff212121);
const Color kDarkAccentColor = Color(0xffbbabf6);
const Color kPrimaryColor = Color(0xFFc8847a);
const Color kPrimaryColorVariant = Color(0xfff0b4ac);
const Color kSecondaryColor = Color(0xfff0b4ac);
const Color kLightColor = Color(0xfff5eded);
const Color kWelcomeColor = Color(0xfff0b4ac);
const Color kDisabledColor = Color(0xFFdee1ec);
const Color kBlack = Colors.black87;
const Color kWhite = Colors.white;
const Color kFadedColor = Color(0xFFA0A5BD);
final kShadowColor = Color(0xFFD3D3D3).withOpacity(.84);

/// Dimens
// Buttons
const double kButtonHeight = 48.0;
// Avatars
const double kAvatarSize = 48.0;
const double kSmallAvatarSize = 36.0;
const double kLargeAvatarSize = 96.0;
const double kXLargeAvatarSize = 120.0;
// Z-Index
const double kCardElevation = 2.0;
const double kChatHeadElevation = 4.0;
const double kBottomNavElevation = 8.0;
// Opacity
const double kLightOpacity = 0.3;
const double kMidOpacity = 0.4;
const double kDefaultOpacity = 0.6;
const double kNoOpacity = 0.9;
// Spacing
const double kSpacingNone = 0.0;
const double kSpacingSmall = 4.0;
const double kSpacingNormal = 8.0;
const double kSpacingMid = 12.0;
const double kSpacingLarge = 16.0;
const double kSpacingXLarge = 24.0;
const double kSpacingXXLarge = 36.0;
const double kSpacingXXXLarge = 64.0;
const double kSpacingHuge = 96.0;

/// Constants
const String kAppName = "Home IoT System";
const String kAppNameShort = "HomeSys";
// FIXME: You can add you won description here
const String kAppDescShort =
    "Control, organise & manage compatible light, speakers, doors etc with one or more taps only.";

/// Keys
const String kPrefsName = "prefs_homesys";
const String kPrefsKey = "prefs_user_key";
const String kPrefsSettings = "prefs_settings";
const String kPrefsUser = "prefs_user";

/// Refs
const String kUsersRef = "users";
const String kMembersRef = "members";

/// Testing
const String kDefaultAvatar =
    "https://images.unsplash.com/flagged/photo-1558829608-12b0a5d6dbc1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=60";
const String kDefaultEmail = "demo@domain.com";
const String kDefaultUserName = "John Doe";


abstract class Globals {
  static String kUserPin;
  static String kUser;
}
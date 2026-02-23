import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @applyForALoan.
  ///
  /// In en, this message translates to:
  /// **'Apply for a Loan'**
  String get applyForALoan;

  /// No description provided for @approvals.
  ///
  /// In en, this message translates to:
  /// **'Approvals'**
  String get approvals;

  /// No description provided for @begin.
  ///
  /// In en, this message translates to:
  /// **'Begin'**
  String get begin;

  /// No description provided for @builtInSecurity.
  ///
  /// In en, this message translates to:
  /// **'Built-In Security'**
  String get builtInSecurity;

  /// No description provided for @connectionStillMissing.
  ///
  /// In en, this message translates to:
  /// **'Connection still missing'**
  String get connectionStillMissing;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @customAmounts.
  ///
  /// In en, this message translates to:
  /// **'Custom Amounts'**
  String get customAmounts;

  /// No description provided for @dataSecurity.
  ///
  /// In en, this message translates to:
  /// **'Data Security'**
  String get dataSecurity;

  /// No description provided for @fast.
  ///
  /// In en, this message translates to:
  /// **'Fast'**
  String get fast;

  /// No description provided for @fastPayouts.
  ///
  /// In en, this message translates to:
  /// **'Fast Payouts'**
  String get fastPayouts;

  /// No description provided for @loans.
  ///
  /// In en, this message translates to:
  /// **'Loans'**
  String get loans;

  /// No description provided for @noExtraCharges.
  ///
  /// In en, this message translates to:
  /// **'no extra Charges'**
  String get noExtraCharges;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicyCommonText.
  ///
  /// In en, this message translates to:
  /// **'This Privacy Policy outlines how our application (“App”) collects, utilizes, and safeguards your personal data. By using the App, you agree to the practices described below.'**
  String get privacyPolicyCommonText;

  /// No description provided for @privacyPolicy1.
  ///
  /// In en, this message translates to:
  /// **'1. Information We Collect'**
  String get privacyPolicy1;

  /// No description provided for @privacyPolicy1Text.
  ///
  /// In en, this message translates to:
  /// **'To provide our services effectively, the App may collect the following types of information: Device Details: Such as your device model, operating system version, and language settings. Approximate Location: Data at the country or state level to present relevant financial offers (we do nottrack or store precise GPS location). Identifiers: Including your IP address, unique device ID, or advertising ID. User-Provided Data: Information you choose to share, such as your name, email address, contact details, and financial preferences.'**
  String get privacyPolicy1Text;

  /// No description provided for @privacyPolicy2.
  ///
  /// In en, this message translates to:
  /// **'2. How We Use Your Information'**
  String get privacyPolicy2;

  /// No description provided for @privacyPolicy2Text.
  ///
  /// In en, this message translates to:
  /// **'We process collected data strictly for lawful purposes, including: Displaying financial offers from verified third-party providers. Verifying identity and preventing fraud or unauthorized access. Communicating with you (where consent has been provided). Enhancing the App’s features, performance, and overall user experience.'**
  String get privacyPolicy2Text;

  /// No description provided for @privacyPolicy3.
  ///
  /// In en, this message translates to:
  /// **'3. Our Restrictions and Commitments'**
  String get privacyPolicy3;

  /// No description provided for @privacyPolicy3Text.
  ///
  /// In en, this message translates to:
  /// **'We follow strict data protection standards: We do not sell, rent, or trade your personal information to third parties for profit. The App does not issue, manage, or service loans directly. We do not collect unnecessary information that is not essential to the App’s operation.'**
  String get privacyPolicy3Text;

  /// No description provided for @privacyPolicy4.
  ///
  /// In en, this message translates to:
  /// **'4. Third-Party Services'**
  String get privacyPolicy4;

  /// No description provided for @privacyPolicy4Text.
  ///
  /// In en, this message translates to:
  /// **'The App may connect you with financial services managed by independent partners. These third parties process your data according to their own privacy policies, which are beyond our control. We strongly encourage you to review their policies before using their services.'**
  String get privacyPolicy4Text;

  /// No description provided for @privacyPolicy5.
  ///
  /// In en, this message translates to:
  /// **'5. Data Security'**
  String get privacyPolicy5;

  /// No description provided for @privacyPolicy5Text.
  ///
  /// In en, this message translates to:
  /// **'We employ industry-standard security measures, such as encryption and restricted access, to protect your personal information. While no digital platform can guarantee 100% security, we take all reasonable steps to mitigate risks.'**
  String get privacyPolicy5Text;

  /// No description provided for @privacyPolicy6.
  ///
  /// In en, this message translates to:
  /// **'6. Your Rights'**
  String get privacyPolicy6;

  /// No description provided for @privacyPolicy6Text.
  ///
  /// In en, this message translates to:
  /// **'Depending on your jurisdiction (e.g., CCPA in California), you may have the following rights: The right to access the personal information we hold about you. The right to request the deletion of your data. The right to opt-out of specific data processing activities. To exercise any of these rights, please contact us via email.'**
  String get privacyPolicy6Text;

  /// No description provided for @privacyPolicy7.
  ///
  /// In en, this message translates to:
  /// **'7. Protection of Minors'**
  String get privacyPolicy7;

  /// No description provided for @privacyPolicy7Text.
  ///
  /// In en, this message translates to:
  /// **'The App is not intended for individuals under the age of 18. If we discover that we have inadvertently collected data from a minor, it will be deleted immediately.'**
  String get privacyPolicy7Text;

  /// No description provided for @privacyPolicy8.
  ///
  /// In en, this message translates to:
  /// **'8. Policy Updates'**
  String get privacyPolicy8;

  /// No description provided for @privacyPolicy8Text.
  ///
  /// In en, this message translates to:
  /// **'We may update this Privacy Policy periodically. In the event of significant changes, we will notify you through an in-app alert or via email.'**
  String get privacyPolicy8Text;

  /// No description provided for @setup.
  ///
  /// In en, this message translates to:
  /// **'Setup'**
  String get setup;

  /// No description provided for @sloganFirst.
  ///
  /// In en, this message translates to:
  /// **'Get approved in a flash.\nNo long waits.'**
  String get sloganFirst;

  /// No description provided for @sloganSecond.
  ///
  /// In en, this message translates to:
  /// **'Just a few steps to\ncomplete your setup.'**
  String get sloganSecond;

  /// No description provided for @sloganThird.
  ///
  /// In en, this message translates to:
  /// **'Your loan application\nis just a click away.'**
  String get sloganThird;

  /// No description provided for @speedy.
  ///
  /// In en, this message translates to:
  /// **'Speedy'**
  String get speedy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of service'**
  String get termsOfService;

  /// No description provided for @termsOfServiceCommon.
  ///
  /// In en, this message translates to:
  /// **'Terms of service'**
  String get termsOfServiceCommon;

  /// No description provided for @termsOfServiceCommonText.
  ///
  /// In en, this message translates to:
  /// **'Thank you for choosing us. These Terms of Use govern your use of our service. By using the app, you automatically agree to these Terms. If you do not agree with any point, please stop using the platform.'**
  String get termsOfServiceCommonText;

  /// No description provided for @termsOfService1.
  ///
  /// In en, this message translates to:
  /// **'1. Our Role and Services'**
  String get termsOfService1;

  /// No description provided for @termsOfService1Text.
  ///
  /// In en, this message translates to:
  /// **'We act as an intermediary, helping you discover financial offers from trusted partners. We do not issue loans and do not make decisions regarding their approval. Our goal is to provide you with convenient access to options so you can choose what works best for you.'**
  String get termsOfService1Text;

  /// No description provided for @termsOfService2.
  ///
  /// In en, this message translates to:
  /// **'2. User Requirements'**
  String get termsOfService2;

  /// No description provided for @termsOfService2Text.
  ///
  /// In en, this message translates to:
  /// **'To use this service, you must: Be of legal age (18+ years old). Use the app only for personal and lawful purposes. Provide exclusively truthful information. Note: In case of fraud or violations, we reserve the right to block your access.'**
  String get termsOfService2Text;

  /// No description provided for @termsOfService3.
  ///
  /// In en, this message translates to:
  /// **'3. Disclaimers and Advice'**
  String get termsOfService3;

  /// No description provided for @termsOfService3Text.
  ///
  /// In en, this message translates to:
  /// **'Please take note of the following: We do not guarantee loan approval or a match with a lender. We do not claim that the options provided are the only ones available on the market. We are not financial advisors. All decisions are made independently; please consult a professional if needed.'**
  String get termsOfService3Text;

  /// No description provided for @termsOfService4.
  ///
  /// In en, this message translates to:
  /// **'4. Privacy and Data'**
  String get termsOfService4;

  /// No description provided for @termsOfService4Text.
  ///
  /// In en, this message translates to:
  /// **'By entering personal data, you confirm it is accurate and up-to-date. We respect your privacy—for more details on how we process information, please read our Privacy Policy.'**
  String get termsOfService4Text;

  /// No description provided for @termsOfService5.
  ///
  /// In en, this message translates to:
  /// **'5. Third-Party Services'**
  String get termsOfService5;

  /// No description provided for @termsOfService5Text.
  ///
  /// In en, this message translates to:
  /// **'The app may redirect you to third-party services. These providers have their own rules and privacy policies, for which we are not responsible. We strongly recommend reviewing them.'**
  String get termsOfService5Text;

  /// No description provided for @termsOfService6.
  ///
  /// In en, this message translates to:
  /// **'6. Intellectual Property'**
  String get termsOfService6;

  /// No description provided for @termsOfService6Text.
  ///
  /// In en, this message translates to:
  /// **'All app content (text, design, code) belongs to us or our licensors. Copying or modifying these materials without our permission is prohibited.'**
  String get termsOfService6Text;

  /// No description provided for @termsOfService7.
  ///
  /// In en, this message translates to:
  /// **'7. Limitation of Liability'**
  String get termsOfService7;

  /// No description provided for @termsOfService7Text.
  ///
  /// In en, this message translates to:
  /// **'The app is provided on an \"as is\" basis: We do not guarantee the absence of technical glitches. We are not liable for any damages related to the use of the service (within the limits defined by law).'**
  String get termsOfService7Text;

  /// No description provided for @termsOfService8.
  ///
  /// In en, this message translates to:
  /// **'8. Loan Terms Transparency'**
  String get termsOfService8;

  /// No description provided for @termsOfService8Text.
  ///
  /// In en, this message translates to:
  /// **'Since we are not lenders, the final terms are set by the partner. General guidelines: Maximum Rate (APR): up to 35.99%. Term: from 3 to 60 months. Example: Borrowing \$5,000 for 24 months at an APR of 25% would result in a total repayment of \$6,404.88. This includes the \$5,000 principal and \$1,404.88 in total interest. Please borrow responsibly and ensure you can meet the repayment schedule.'**
  String get termsOfService8Text;

  /// No description provided for @termsOfService9.
  ///
  /// In en, this message translates to:
  /// **'9. Updates and Legal Framework'**
  String get termsOfService9;

  /// No description provided for @termsOfService9Text.
  ///
  /// In en, this message translates to:
  /// **'Updates: We may update these Terms. We will notify you of significant changes within the app or via email. Governing Law: These Terms are governed by U.S. law. Any disputes shall be resolved in the appropriate local courts.'**
  String get termsOfService9Text;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

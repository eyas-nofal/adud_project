import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In ar, this message translates to:
  /// **'عَضُد'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In ar, this message translates to:
  /// **'دعم، وصول، تمكين'**
  String get appTagline;

  /// No description provided for @appDescription.
  ///
  /// In ar, this message translates to:
  /// **'منصة اجتماعية تربط الأشخاص ذوي الإعاقة بمتطوعين قريبين منهم لتقديم الدعم والمساعدة'**
  String get appDescription;

  /// No description provided for @togetherWeMakeDifference.
  ///
  /// In ar, this message translates to:
  /// **'معًا نصنع الفرق'**
  String get togetherWeMakeDifference;

  /// No description provided for @createAccount.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب جديد'**
  String get createAccount;

  /// No description provided for @login.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login;

  /// No description provided for @changeLanguage.
  ///
  /// In ar, this message translates to:
  /// **'تغيير اللغة'**
  String get changeLanguage;

  /// No description provided for @selectUserType.
  ///
  /// In ar, this message translates to:
  /// **'اختر نوع الحساب'**
  String get selectUserType;

  /// No description provided for @selectUserTypeSub.
  ///
  /// In ar, this message translates to:
  /// **'حدد كيف تريد استخدام التطبيق'**
  String get selectUserTypeSub;

  /// No description provided for @disabilityUser.
  ///
  /// In ar, this message translates to:
  /// **'شخص ذو إعاقة'**
  String get disabilityUser;

  /// No description provided for @disabilityUserDesc.
  ///
  /// In ar, this message translates to:
  /// **'أحتاج إلى مساعدة ودعم من المتطوعين'**
  String get disabilityUserDesc;

  /// No description provided for @volunteer.
  ///
  /// In ar, this message translates to:
  /// **'متطوع'**
  String get volunteer;

  /// No description provided for @volunteerDesc.
  ///
  /// In ar, this message translates to:
  /// **'أريد تقديم المساعدة والدعم للآخرين'**
  String get volunteerDesc;

  /// No description provided for @canChangeTypeLater.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظة: يمكنك تغيير نوع الحساب لاحقاً من الإعدادات'**
  String get canChangeTypeLater;

  /// No description provided for @welcomeBack.
  ///
  /// In ar, this message translates to:
  /// **'أهلاً بك مرة أخرى'**
  String get welcomeBack;

  /// No description provided for @email.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get email;

  /// No description provided for @password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In ar, this message translates to:
  /// **'نسيت كلمة المرور؟'**
  String get forgotPassword;

  /// No description provided for @loginWithGoogle.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول بواسطة Google'**
  String get loginWithGoogle;

  /// No description provided for @loginWithFacebook.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول بواسطة Facebook'**
  String get loginWithFacebook;

  /// No description provided for @dontHaveAccount.
  ///
  /// In ar, this message translates to:
  /// **'ليس لديك حساب؟'**
  String get dontHaveAccount;

  /// No description provided for @createNewAccount.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب جديد'**
  String get createNewAccount;

  /// No description provided for @or.
  ///
  /// In ar, this message translates to:
  /// **'أو'**
  String get or;

  /// No description provided for @loginAs.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول كـ'**
  String get loginAs;

  /// No description provided for @joinUsStartJourney.
  ///
  /// In ar, this message translates to:
  /// **'انضم إلينا وابدأ رحلتك'**
  String get joinUsStartJourney;

  /// No description provided for @firstName.
  ///
  /// In ar, this message translates to:
  /// **'الاسم الأول'**
  String get firstName;

  /// No description provided for @confirmPassword.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور'**
  String get confirmPassword;

  /// No description provided for @agreeToTerms.
  ///
  /// In ar, this message translates to:
  /// **'أوافق على الشروط والأحكام و سياسة الخصوصية'**
  String get agreeToTerms;

  /// No description provided for @passwordMismatch.
  ///
  /// In ar, this message translates to:
  /// **'كلمات المرور غير متطابقة'**
  String get passwordMismatch;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In ar, this message translates to:
  /// **'لديك حساب بالفعل؟ تسجيل الدخول'**
  String get alreadyHaveAccount;

  /// No description provided for @welcomeUser.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً، {name}'**
  String welcomeUser(Object name);

  /// No description provided for @howCanWeHelp.
  ///
  /// In ar, this message translates to:
  /// **'كيف يمكننا مساعدتك اليوم؟'**
  String get howCanWeHelp;

  /// No description provided for @nearbyAccessiblePlaces.
  ///
  /// In ar, this message translates to:
  /// **'أماكن مهيأة قريبة منك'**
  String get nearbyAccessiblePlaces;

  /// No description provided for @requestHelp.
  ///
  /// In ar, this message translates to:
  /// **'طلب مساعدة'**
  String get requestHelp;

  /// No description provided for @requestHelpDesc.
  ///
  /// In ar, this message translates to:
  /// **'فورية أو مجدولة'**
  String get requestHelpDesc;

  /// No description provided for @activeRequests.
  ///
  /// In ar, this message translates to:
  /// **'المساعدات النشطة والقادمة'**
  String get activeRequests;

  /// No description provided for @noActiveRequests.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد مساعدات نشطة حالياً'**
  String get noActiveRequests;

  /// No description provided for @pressRequestHelp.
  ///
  /// In ar, this message translates to:
  /// **'اضغط على \"طلب مساعدة\" لإنشاء طلب جديد'**
  String get pressRequestHelp;

  /// No description provided for @reportInaccessiblePlace.
  ///
  /// In ar, this message translates to:
  /// **'الإبلاغ عن مكان غير مهيأ'**
  String get reportInaccessiblePlace;

  /// No description provided for @improveAccessibility.
  ///
  /// In ar, this message translates to:
  /// **'ساعدنا في تحسين إمكانية الوصول'**
  String get improveAccessibility;

  /// No description provided for @transportation.
  ///
  /// In ar, this message translates to:
  /// **'تنقل ومواصلات'**
  String get transportation;

  /// No description provided for @escort.
  ///
  /// In ar, this message translates to:
  /// **'مرافقة'**
  String get escort;

  /// No description provided for @buyingGroceries.
  ///
  /// In ar, this message translates to:
  /// **'شراء حاجيات'**
  String get buyingGroceries;

  /// No description provided for @universityHelp.
  ///
  /// In ar, this message translates to:
  /// **'مساعدة جامعية'**
  String get universityHelp;

  /// No description provided for @live.
  ///
  /// In ar, this message translates to:
  /// **'مباشر'**
  String get live;

  /// No description provided for @upcoming.
  ///
  /// In ar, this message translates to:
  /// **'قادمة'**
  String get upcoming;

  /// No description provided for @call.
  ///
  /// In ar, this message translates to:
  /// **'اتصال'**
  String get call;

  /// No description provided for @details.
  ///
  /// In ar, this message translates to:
  /// **'التفاصيل'**
  String get details;

  /// No description provided for @cancel.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get cancel;

  /// No description provided for @navHome.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get navHome;

  /// No description provided for @navDonate.
  ///
  /// In ar, this message translates to:
  /// **'التبرع'**
  String get navDonate;

  /// No description provided for @navWorkshops.
  ///
  /// In ar, this message translates to:
  /// **'الورش'**
  String get navWorkshops;

  /// No description provided for @navProfile.
  ///
  /// In ar, this message translates to:
  /// **'حسابي'**
  String get navProfile;

  /// No description provided for @navHonorRoll.
  ///
  /// In ar, this message translates to:
  /// **'لوحة الشرف'**
  String get navHonorRoll;

  /// No description provided for @thanksForGiving.
  ///
  /// In ar, this message translates to:
  /// **'شكراً لعطائك المستمر'**
  String get thanksForGiving;

  /// No description provided for @rewardPoints.
  ///
  /// In ar, this message translates to:
  /// **'نقاط المكافآت'**
  String get rewardPoints;

  /// No description provided for @nearbyRequests.
  ///
  /// In ar, this message translates to:
  /// **'طلبات قريبة منك'**
  String get nearbyRequests;

  /// No description provided for @acceptRequest.
  ///
  /// In ar, this message translates to:
  /// **'قبول الطلب'**
  String get acceptRequest;

  /// No description provided for @rewardOffers.
  ///
  /// In ar, this message translates to:
  /// **'عروض المكافآت'**
  String get rewardOffers;

  /// No description provided for @redeem.
  ///
  /// In ar, this message translates to:
  /// **'استبدل'**
  String get redeem;

  /// No description provided for @completedHelp.
  ///
  /// In ar, this message translates to:
  /// **'مساعدة مكتملة'**
  String get completedHelp;

  /// No description provided for @rating.
  ///
  /// In ar, this message translates to:
  /// **'التقييم'**
  String get rating;

  /// No description provided for @thisMonth.
  ///
  /// In ar, this message translates to:
  /// **'هذا الشهر'**
  String get thisMonth;

  /// No description provided for @fillDetailsFindVolunteer.
  ///
  /// In ar, this message translates to:
  /// **'املأ التفاصيل وسنجد لك متطوعاً قريباً'**
  String get fillDetailsFindVolunteer;

  /// No description provided for @helpType.
  ///
  /// In ar, this message translates to:
  /// **'نوع المساعدة المطلوبة'**
  String get helpType;

  /// No description provided for @requestNow.
  ///
  /// In ar, this message translates to:
  /// **'الآن'**
  String get requestNow;

  /// No description provided for @requestLater.
  ///
  /// In ar, this message translates to:
  /// **'لاحقاً'**
  String get requestLater;

  /// No description provided for @selectDate.
  ///
  /// In ar, this message translates to:
  /// **'اختر التاريخ'**
  String get selectDate;

  /// No description provided for @selectTime.
  ///
  /// In ar, this message translates to:
  /// **'اختر الوقت'**
  String get selectTime;

  /// No description provided for @expectedDuration.
  ///
  /// In ar, this message translates to:
  /// **'المدة المتوقعة (بالساعات)'**
  String get expectedDuration;

  /// No description provided for @payVolunteer.
  ///
  /// In ar, this message translates to:
  /// **'هل تريد دفع مبلغ للمتطوع؟'**
  String get payVolunteer;

  /// No description provided for @amountJOD.
  ///
  /// In ar, this message translates to:
  /// **'المبلغ بالدينار الأردني'**
  String get amountJOD;

  /// No description provided for @additionalNotes.
  ///
  /// In ar, this message translates to:
  /// **'ملاحظات إضافية (اختياري)'**
  String get additionalNotes;

  /// No description provided for @sendRequest.
  ///
  /// In ar, this message translates to:
  /// **'إرسال الطلب'**
  String get sendRequest;

  /// No description provided for @activeVolunteer.
  ///
  /// In ar, this message translates to:
  /// **'متطوع نشط'**
  String get activeVolunteer;

  /// No description provided for @user.
  ///
  /// In ar, this message translates to:
  /// **'مستخدم'**
  String get user;

  /// No description provided for @completedActivity.
  ///
  /// In ar, this message translates to:
  /// **'نشاط مكتمل'**
  String get completedActivity;

  /// No description provided for @providedHelp.
  ///
  /// In ar, this message translates to:
  /// **'مساعدات مقدّمة'**
  String get providedHelp;

  /// No description provided for @receivedHelp.
  ///
  /// In ar, this message translates to:
  /// **'مساعدات مستلمة'**
  String get receivedHelp;

  /// No description provided for @contributionHours.
  ///
  /// In ar, this message translates to:
  /// **'ساعات المساهمة'**
  String get contributionHours;

  /// No description provided for @earnedPoints.
  ///
  /// In ar, this message translates to:
  /// **'النقاط المكتسبة'**
  String get earnedPoints;

  /// No description provided for @honorRollDesc.
  ///
  /// In ar, this message translates to:
  /// **'شاهد إنجازاتك وترتيبك'**
  String get honorRollDesc;

  /// No description provided for @settings.
  ///
  /// In ar, this message translates to:
  /// **'الإعدادات'**
  String get settings;

  /// No description provided for @notifications.
  ///
  /// In ar, this message translates to:
  /// **'الإشعارات'**
  String get notifications;

  /// No description provided for @privacyPolicy.
  ///
  /// In ar, this message translates to:
  /// **'سياسة الخصوصية'**
  String get privacyPolicy;

  /// No description provided for @termsAndConditions.
  ///
  /// In ar, this message translates to:
  /// **'الشروط والأحكام'**
  String get termsAndConditions;

  /// No description provided for @helpSupport.
  ///
  /// In ar, this message translates to:
  /// **'المساعدة والدعم'**
  String get helpSupport;

  /// No description provided for @logout.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get logout;
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
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
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

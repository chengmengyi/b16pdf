import 'package:b16pdf/b16_hep_djijdow/b16_applife_hep_fjeifje.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_language_hep_fjeifje/b16_language_hep_kqmvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_quick_action_hep_fjeifjiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_tba_hep_djiwjidw.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'b16_hep_djijdow/b16_notification_hep_djiwdow/b16_notification_hep_jsowkosw.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  B16QuickActionHepFjeifjiw.instance.init();
  B16ApplifeHepFjeifje.instance.b16StartObserverKpvnza();
  final Locale b16InitialLocaleQmxvza = B16LanguageHepKqmvza.b16ResolveInitialLocaleRmqxve();
  B16NotificationHepPqnvze.instance.b16InitializeNotificationsQxnvza(b16RequestPermissionKqmwze: true);
  B16TbaHepDjiwjidw.instance.b16UploadInstallQxnvza();

  runApp(B16ApplicationVqmxza(b16InitialLocaleHqmwze: b16InitialLocaleQmxvza));
}

class B16ApplicationVqmxza extends StatelessWidget {
  const B16ApplicationVqmxza({super.key, required this.b16InitialLocaleHqmwze});

  final Locale b16InitialLocaleHqmwze;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      builder: (BuildContext b16ContextKqmwze, Widget? b16ChildVqnxra) =>
          RefreshConfiguration(
            springDescription: const SpringDescription(
              mass: 0.8,
              stiffness: 150,
              damping: 20.0,
            ),
            child: GetMaterialApp(
              onGenerateTitle: (BuildContext b16ContextTqmwva) => 'PDF'.tr,
              enableLog: true,
              darkTheme: ThemeData.dark(),
              themeMode: ThemeMode.system,
              debugShowCheckedModeBanner: false,
              translations: B16LanguageHepKqmvza(),
              locale: b16InitialLocaleHqmwze,
              fallbackLocale: B16LanguageHepKqmvza.b16FallbackLocaleCqnxwa,
              supportedLocales: B16LanguageHepKqmvza.b16SupportedLocalesJxqvte,
              initialRoute: B16RoutersAddressFjeifjeo.b16LauncherRouteKfmoqa,
              getPages: B16RoutersAddressFjeifjeo.b16PagesRxqtma,
              defaultTransition: Transition.rightToLeft,
              localizationsDelegates: const [
                RefreshLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              builder:
                  (BuildContext b16ContextPqmwza, Widget? b16WidgetVqnxre) {
                    return MediaQuery(
                      data: MediaQuery.of(
                        b16ContextPqmwza,
                      ).copyWith(textScaler: const TextScaler.linear(1.0)),
                      child: b16WidgetVqnxre ?? const SizedBox.shrink(),
                    );
                  },
            ),
          ),
    );
  }
}

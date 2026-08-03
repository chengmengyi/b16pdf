import 'package:get/get.dart';

abstract final class B16RoutersHepFjeifjoe {
  static Future<T?>? b16PushNamedHkqvpa<T>({
    required String b16RouteNameMcfzsq,
    Map<String, dynamic>? b16ArgumentsXvedlu,
  }) {
    return Get.toNamed<T>(b16RouteNameMcfzsq, arguments: b16ArgumentsXvedlu);
  }

  static Future<T?>? b16ReplaceNamedZxplrt<T>({
    required String b16RouteNameYweqpn,
    Map<String, dynamic>? b16ArgumentsKstjva,
  }) {
    return Get.offNamed<T>(b16RouteNameYweqpn, arguments: b16ArgumentsKstjva);
  }

  static Future<T?>? b16ResetToNamedNvrmce<T>({
    required String b16RouteNameDqyxka,
    Map<String, dynamic>? b16ArgumentsBlgfru,
  }) {
    return Get.offAllNamed<T>(
      b16RouteNameDqyxka,
      arguments: b16ArgumentsBlgfru,
    );
  }

  static void b16PopUntilNameWvxhqt(String b16RouteNamePzjlem) {
    Get.until((b16RouteKqmcdu) {
      return b16RouteKqmcdu.settings.name == b16RouteNamePzjlem;
    });
  }

  static void b16BackFtynwp<T>({T? b16ResultNcgkqe}) {
    Get.back<T>(result: b16ResultNcgkqe);
  }
}

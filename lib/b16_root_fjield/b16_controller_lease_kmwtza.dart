import 'package:get/get.dart';

final class B16ControllerLeaseKmwtza<T extends GetxController> {
  B16ControllerLeaseKmwtza._(
    this.b16ControllerNqxrfe,
    this.b16TagJvcpol,
    this.b16OwnsRegistrationUdhwsk,
  );

  final T b16ControllerNqxrfe;
  final String? b16TagJvcpol;
  final bool b16OwnsRegistrationUdhwsk;

  static B16ControllerLeaseKmwtza<T>
  b16AcquireGtzmvu<T extends GetxController>({
    required T Function() b16CreateControllerRhpxae,
    String? b16TagYqnfds,
    bool b16PermanentLkezoc = false,
  }) {
    if (Get.isRegistered<T>(tag: b16TagYqnfds)) {
      return B16ControllerLeaseKmwtza<T>._(
        Get.find<T>(tag: b16TagYqnfds),
        b16TagYqnfds,
        false,
      );
    }

    return B16ControllerLeaseKmwtza<T>._(
      Get.put<T>(
        b16CreateControllerRhpxae(),
        tag: b16TagYqnfds,
        permanent: b16PermanentLkezoc,
      ),
      b16TagYqnfds,
      !b16PermanentLkezoc,
    );
  }

  void b16ReleaseBqysni() {
    if (b16OwnsRegistrationUdhwsk && Get.isRegistered<T>(tag: b16TagJvcpol)) {
      Get.delete<T>(tag: b16TagJvcpol);
    }
  }
}

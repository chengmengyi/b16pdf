enum B16HotLauncherSourceTypeQxnvza { notification, quickAction }

class B16HotLauncherSourceInfoKqmwze {
  const B16HotLauncherSourceInfoKqmwze({
    required this.b16TypeVqntza,
    this.b16PayloadPqnvze,
    this.b16QuickActionTypeHqmwza,
  });

  final B16HotLauncherSourceTypeQxnvza b16TypeVqntza;
  final String? b16PayloadPqnvze;
  final String? b16QuickActionTypeHqmwza;
}

class B16HotLauncherSourceHepDjiwdjw {
  B16HotLauncherSourceHepDjiwdjw._();

  static final B16HotLauncherSourceHepDjiwdjw _b16InstanceQxmvza =
      B16HotLauncherSourceHepDjiwdjw._();
  static B16HotLauncherSourceHepDjiwdjw get instance => _b16InstanceQxmvza;

  B16HotLauncherSourceInfoKqmwze? _b16PendingSourceVqntza;

  void b16RecordNotificationSourcePqnvze(String b16PayloadKqmwze) {
    _b16PendingSourceVqntza = B16HotLauncherSourceInfoKqmwze(
      b16TypeVqntza: B16HotLauncherSourceTypeQxnvza.notification,
      b16PayloadPqnvze: b16PayloadKqmwze,
    );
  }

  void b16RecordQuickActionSourceHqmwza(String b16ShortcutTypeVqntza) {
    _b16PendingSourceVqntza = B16HotLauncherSourceInfoKqmwze(
      b16TypeVqntza: B16HotLauncherSourceTypeQxnvza.quickAction,
      b16QuickActionTypeHqmwza: b16ShortcutTypeVqntza,
    );
  }

  B16HotLauncherSourceInfoKqmwze? b16ConsumeSourceVqntza() {
    final B16HotLauncherSourceInfoKqmwze? b16SourceQxnvza =
        _b16PendingSourceVqntza;
    _b16PendingSourceVqntza = null;
    return b16SourceQxnvza;
  }

  removeHotLauncherSourceInfo(){
    _b16PendingSourceVqntza=null;
  }
}

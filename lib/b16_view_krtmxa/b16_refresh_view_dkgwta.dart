import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum B16RefreshOutcomeKqvzma {
  b16SucceededHqmwza,
  b16FailedVxtqke,
  b16NoMoreDataCjrpyn,
}

void b16RequestRefreshHnqwze(RefreshController b16ControllerPxtmva) {
  if (b16ControllerPxtmva.isRefresh) {
    return;
  }
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!b16ControllerPxtmva.isRefresh &&
        b16ControllerPxtmva.position != null) {
      b16ControllerPxtmva.requestRefresh();
    }
  });
}

void b16FinishRefreshGmwxra(
  RefreshController b16ControllerVqztne,
  B16RefreshOutcomeKqvzma b16OutcomeJfcypu,
) {
  if (b16ControllerVqztne.isRefresh) {
    switch (b16OutcomeJfcypu) {
      case B16RefreshOutcomeKqvzma.b16SucceededHqmwza:
      case B16RefreshOutcomeKqvzma.b16NoMoreDataCjrpyn:
        b16ControllerVqztne.refreshCompleted(resetFooterState: true);
      case B16RefreshOutcomeKqvzma.b16FailedVxtqke:
        b16ControllerVqztne.refreshFailed();
    }
  }

  if (!b16ControllerVqztne.isLoading) {
    return;
  }
  switch (b16OutcomeJfcypu) {
    case B16RefreshOutcomeKqvzma.b16SucceededHqmwza:
      b16ControllerVqztne.loadComplete();
    case B16RefreshOutcomeKqvzma.b16FailedVxtqke:
      b16ControllerVqztne.loadFailed();
    case B16RefreshOutcomeKqvzma.b16NoMoreDataCjrpyn:
      b16ControllerVqztne.loadNoData();
  }
}

class B16RefreshViewDkgwta extends StatelessWidget {
  const B16RefreshViewDkgwta({
    super.key,
    required this.b16ControllerXqmvta,
    required this.b16ChildJkznwe,
    this.b16OnRefreshCqpydu,
    this.b16OnLoadMoreVfmxra,
    this.b16EnableRefreshHqtwze = true,
    this.b16EnableLoadMoreNpkxvu = false,
    this.b16ScrollControllerGzrqma,
    this.b16HeaderLwcvpe,
    this.b16FooterTqnxya,
  });

  final RefreshController b16ControllerXqmvta;
  final Widget b16ChildJkznwe;
  final VoidCallback? b16OnRefreshCqpydu;
  final VoidCallback? b16OnLoadMoreVfmxra;
  final bool b16EnableRefreshHqtwze;
  final bool b16EnableLoadMoreNpkxvu;
  final ScrollController? b16ScrollControllerGzrqma;
  final Widget? b16HeaderLwcvpe;
  final Widget? b16FooterTqnxya;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: b16ControllerXqmvta,
      scrollController: b16ScrollControllerGzrqma,
      enablePullDown: b16EnableRefreshHqtwze,
      enablePullUp: b16EnableLoadMoreNpkxvu,
      onRefresh: b16OnRefreshCqpydu,
      onLoading: b16OnLoadMoreVfmxra,
      header: b16HeaderLwcvpe ?? const ClassicHeader(),
      footer: b16FooterTqnxya ?? const ClassicFooter(),
      child: b16ChildJkznwe,
    );
  }
}

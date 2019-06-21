import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class BannerState implements Cloneable<BannerState> {
  List<HomeDataBanner> bannerData;

  @override
  BannerState clone() {
    return BannerState();
  }
}

BannerState initState(Map<String, dynamic> args) {
  return BannerState();
}

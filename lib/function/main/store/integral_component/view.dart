import 'package:cached_network_image/cached_network_image.dart';
import 'package:chongmeng/constants/page_constants.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'state.dart';

var imageUrl =
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1066068643,2562343175&fm=15&gp=0.jpg";

Widget buildView(
    IntegralItemState state, Dispatch dispatch, ViewService viewService) {
  final Widget image = GestureDetector(
    onTap: () {
      Navigator.pushNamed(
          viewService.context, PageConstants.IntegralCommodityDetailPage);
    },
    child: Hero(
      key: Key(state.index.toString()),
      tag: state.index.toString(),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
      ),
    ),
  );
  return GridTile(
    footer: GestureDetector(
      onTap: () {
        /*onBannerTap(photo); */
      },
      child: GridTileBar(
        backgroundColor: Colors.black45,
        title: _GridTitleText("标题标题"),
        subtitle: _GridTitleText("子标题子标题"),
        trailing: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    ),
    child: image,
  );
}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Text(text),
    );
  }
}

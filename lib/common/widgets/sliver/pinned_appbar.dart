import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PinnedAppBar extends StatelessWidget {
  final PreferredSizeWidget child;
  final Color ? color;
  final bool  isPinned;

  const PinnedAppBar({ Key ? key, required this.child, this.color, this.isPinned = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverAppBarDelegate(child, color),
      pinned: isPinned,
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar, this.color);

  final PreferredSizeWidget _tabBar;
  final Color ? color;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(child: _tabBar, color: color ?? Colors.white);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

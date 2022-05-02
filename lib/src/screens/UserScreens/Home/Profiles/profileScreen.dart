import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/infoCard.dart';
import 'package:ecentialsclone/src/Widgets/profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      floatingActionButton: const FloatingAmbulance(),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSliverAppBarDelegate(expandedHeight: 300),
            pinned: true,
          ),
          buildInfoCard(),
        ],
      ),
    );
  }

  Widget buildInfoCard() => SliverGrid(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        delegate: SliverChildBuilderDelegate(
            (context, index) => InfoCard(
                  topText: "Health ",
                  bottomText: "Information",
                  showlock: index == 1 ? true : false,
                ),
            childCount: 3),
      );
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({required this.expandedHeight});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        buildBackground(),
        buildAppBar(shrinkOffset),
        Positioned(
            bottom: 10,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: AppColors.primaryOrangeColor,
              mini: true,
              onPressed: () {},
              child: Icon(EcentialsIcons.pencil),
            ))
      ],
    );
  }

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          foregroundColor: AppColors.primaryWhiteColor,
        ),
      );

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  Widget buildBackground() => Image.asset(
        "assets/images/profile.png",
        fit: BoxFit.cover,
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

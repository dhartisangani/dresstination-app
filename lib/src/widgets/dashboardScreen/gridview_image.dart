import 'package:dresti_frontend/src/screens/expand_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomImageGrid extends StatelessWidget {
  final int index;

  const CustomImageGrid({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        crossAxisSpacing: 8,
        pattern: [
          const WovenGridTile(
            90 / 100,
            crossAxisRatio: 0.75,
            alignment: AlignmentDirectional.centerEnd,
          ),
          const WovenGridTile(
            1.3,
            crossAxisRatio: 0.9,
            alignment: AlignmentDirectional.centerStart,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: 4,
        (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExpandView(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: ExactAssetImage("assets/images/f-${index + 1}.png"),
                fit: BoxFit.cover, // Adjust BoxFit if necessary
              ),
            ),
          ),
        ),
      ),
    );
  }
}
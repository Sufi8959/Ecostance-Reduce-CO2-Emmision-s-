import 'package:flutter/material.dart';
import 'package:net_carbons/presentation/profile/child_screens/dashboard/Product.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../resources/color.dart';

class ProjectsTimelineTile extends StatelessWidget {
  final int index;
  final Product product;
  // final bool isLast;

  ProjectsTimelineTile(
      {super.key, required this.index, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: TimelineTile(
        isFirst: index == 0 ? true : false,
        isLast: false,
        beforeLineStyle: LineStyle(color: Colors.black, thickness: 2),
        indicatorStyle: IndicatorStyle(
            width: 32,
            color: Colors.black,
            iconStyle: IconStyle(iconData: Icons.hexagon, color: Colors.white)),
        endChild: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 32),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: AppColors.inactiveSliderTrack, width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(product.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold,)),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(product.shortDesc,
                        maxLines: 7,),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Image.network(
                      product.image,
                      height: 100,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

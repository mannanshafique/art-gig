
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Utils/app_colors.dart';
import 'custom_text.dart';

class CustomTimePickerWidget extends StatelessWidget {
  final int? selectedMin;
  final ValueChanged<String> onChanged;

  final List? list;

  CustomTimePickerWidget(
      {this.selectedMin, required this.onChanged, this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // SizedBox(
        //   height: 10.0,
        // ),
        Divider(),
        SizedBox(height: 10.0),
        Container(
          // Need to use container to add size constraint.
          width: 300,
          height: 250,
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: _monthPickerGridDelegate,
              itemCount: list?.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: () {
                    onChanged(list?[index]);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                        color: selectedMin == (index + 1)
                            ? AppColors.PINK_COLOR
                            : AppColors.TRANSPARENT_COLOR,
                        borderRadius: BorderRadius.circular(
                            selectedMin == (index + 1) ? 30.0 : 0)),
                    child: CustomText(
                      text: list?[index],
                      fontColor: selectedMin == (index + 1)
                          ? AppColors.WHITE_COLOR
                          : AppColors.BLACK_COLOR.withOpacity(0.8),
                    ),
                  ),
                );
              }),
        ),
        Divider(),
        SizedBox(height: 20.0),
      ],
    );
  }
}

class _MonthPickerGridDelegate extends SliverGridDelegate {
  const _MonthPickerGridDelegate();

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final double tileWidth = (constraints.crossAxisExtent - (3 - 1) * 8) / 3;
    return SliverGridRegularTileLayout(
      childCrossAxisExtent: tileWidth,
      childMainAxisExtent: 52,
      crossAxisCount: 3,
      crossAxisStride: tileWidth + 8,
      mainAxisStride: 52,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_MonthPickerGridDelegate oldDelegate) => false;
}

const _MonthPickerGridDelegate _monthPickerGridDelegate =
    _MonthPickerGridDelegate();
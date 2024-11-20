import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../Utils/app_colors.dart';

class CustomSlidableWidget extends StatelessWidget {
  final Widget child;
  final Function(BuildContext)? onTap;
  final bool? isenable;

  const CustomSlidableWidget({required this.child, this.onTap, this.isenable});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: UniqueKey(),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: onTap,
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.RED_COLOR,
              icon: Icons.delete,
              //label: 'Delete',
            ),
          ],
        ),
        child: child);
  }
}

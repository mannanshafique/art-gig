import 'package:artgig/Module/Event/Screen/create_event_screen.dart';
import 'package:artgig/Utils/app_colors.dart';
import 'package:artgig/Utils/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Utils/app_strings.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/cs_bottom_navg_button.dart';
import '../../../Widgets/custom_scaffold.dart';

class SelectPaintingScreen extends StatefulWidget {
  const SelectPaintingScreen({super.key});

  @override
  _SelectPaintingScreenState createState() => _SelectPaintingScreenState();
}

class _SelectPaintingScreenState extends State<SelectPaintingScreen> {
  List<String> images = List.generate(
      12, (index) => AssetPaths.TEMP_EVENT_IMAGES); // Replace with real images
  Set<int> selectedIndexes = {};

  void toggleSelection(int index) {
    setState(() {
      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
      } else {
        selectedIndexes.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scffoldBg: AppColors.TRANSPARENT_COLOR,
      appBar: customAppBar(
          context: context,
          isLeadingBack: true,
          title: AppStrings.SELECT_PAINTING),
      bottomNavigationBar: CustomBottomNavigationWidget(
        buttonTitle: AppStrings.SELECT_PAINTING,
        onTap: () {
          Get.to(() => CreateEventScreen());
        },
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndexes.contains(index);
          return GestureDetector(
            onTap: () => toggleSelection(index),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:
                          isSelected ? Colors.pinkAccent : Colors.transparent,
                      width: 3,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(images[index], fit: BoxFit.cover),
                  ),
                ),
                if (isSelected)
                  const Positioned(
                    top: 5,
                    right: 5,
                    child: Icon(Icons.check_circle, color: Colors.pinkAccent),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

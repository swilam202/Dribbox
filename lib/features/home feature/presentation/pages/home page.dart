import 'package:dribbox/core/resources/folders.dart';
import 'package:dribbox/core/resources/font%20weight%20manager.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:dribbox/features/home%20feature/presentation/widgets/home%20page%20folder.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List lois = [
      const HomePageFolder(
        color: Colors.green,
        title: 'Mobile apps',
        icon: Icons.android,
      ),
      const HomePageFolder(
        color: Colors.indigo,
        title: 'Programming',
        icon: Icons.code,
      ),
      const HomePageFolder(
        color: Colors.amber,
        title: 'Files',
        icon: Icons.file_copy_outlined,
      ),
      const HomePageFolder(
        color: Colors.orange,
        title: 'Audio',
        icon: Icons.music_note,
      ),
      const HomePageFolder(
        color: Colors.blue,
        title: 'Videos',
        icon: Icons.ondemand_video,
      ),
      const HomePageFolder(
        color: Colors.red,
        title: 'Images',
        icon: Icons.image,
      ),
      const HomePageFolder(
        color: Colors.teal,
        title: 'Archive',
        icon: Icons.archive_rounded,
      ),
      const HomePageFolder(
        color: Colors.grey,
        title: 'Other',
        icon: Icons.file_present,
      ),
    ];
    var a = APKFolderProperties().;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 20),
            Text(
              'Your dribBox',
              style: StyleManager.bigTextStyle(
                fontWeight: FontWeightManager.semiBoldWeight,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 35),
            Row(
              children: [
                DropdownButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  value: 2,
                  onChanged: (val) {},
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  items: [
                    DropdownMenuItem(
                      value: 1,
                      child: Text(
                        'All',
                        style: StyleManager.bigTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeightManager.normalWeight,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text(
                        'Folders',
                        style: StyleManager.bigTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeightManager.normalWeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: lois.length,
              itemBuilder: (context, index) {
                return lois[index];
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

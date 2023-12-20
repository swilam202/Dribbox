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
          color: Colors.green, title: 'Mobile apps', icon: Icons.android),
      const HomePageFolder(
        color: Colors.amber,
        title: 'Files',
        icon: Icons.file_copy_outlined,
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
    ];
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 20),
            Text('Your dribbbox',style: StyleManager.bigTextStyle(fontWeight: FontWeightManager.semiBoldWeight,fontSize: 24,),),
            SizedBox(height: 35),
            Row(
              children: [
                DropdownButton(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  value: 1,
                  onChanged: (val){},
                  icon: Icon(Icons.arrow_drop_down_sharp),
                  items: [
                    DropdownMenuItem(
                      value: 1,
                      child: Text(
                        'All',
                        style: StyleManager.bigTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeightManager.normalWeight,),
                      ),
                    ),

                    DropdownMenuItem(
                      value: 2,
                      child: Text(
                        'Folders',
                        style: StyleManager.bigTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeightManager.normalWeight,),
                      ),
                    ),
                  ],

                ),
              ],
            ),
            SizedBox(height: 25),
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
          ],
        ),
      ),
    );
  }
}

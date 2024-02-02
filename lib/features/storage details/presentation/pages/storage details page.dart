import 'package:dribbox/core/resources/color%20manager.dart';
import 'package:dribbox/core/resources/font%20weight%20manager.dart';
import 'package:dribbox/core/resources/style%20manager.dart';
import 'package:dribbox/core/utils/calculate%20size.dart';
import 'package:dribbox/core/widgets/custom%20drawer.dart';
import 'package:dribbox/core/widgets/loading%20state.dart';
import 'package:dribbox/features/storage%20details/presentation/controller/storage%20details%20cubit.dart';
import 'package:dribbox/features/storage%20details/presentation/controller/storage%20details%20state.dart';
import 'package:dribbox/features/storage%20details/presentation/widgets/chart%20section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../domain/entites/section.dart';
import '../widgets/types section.dart';

class StorageDetailsPage extends StatefulWidget {
  const StorageDetailsPage({super.key});

  @override
  State<StorageDetailsPage> createState() => _StorageDetailsPageState();
}

class _StorageDetailsPageState extends State<StorageDetailsPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<StorageDetailsCubit>(context).getStorageDetails();
  }

  @override
  Widget build(BuildContext context) {
  /*  final List<Section> sections = [
      Section('Video', 300, Colors.blue),
      Section('Audio', 500, Colors.orange),
      Section('Mobile apps', 400, Colors.green),
      Section('Files', 1000, Colors.amber),
    ];*/
    return CustomDrawer(child: Scaffold(
       appBar: AppBar(
        title: Text(
          'Storage details',
          style: StyleManager.bigTextStyle(
            fontSize: 20,
            fontWeight: FontWeightManager.semiBoldWeight,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
        body: BlocBuilder<StorageDetailsCubit,StorageDetailsState>(
          builder: (context, state) {
            if(state is StorageDetailsSuccessState){
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    ChartSection(state.sections),
                    const SizedBox(height: 27),
                    Text(
                      'Used Storage',
                      style: StyleManager.smallTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeightManager.normalWeight,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      calculateSize(state.total.floor()),
                      style: StyleManager.bigTextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Total 1 GB',
                      style: StyleManager.smallTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeightManager.normalWeight,
                      ),
                    ),
                    const SizedBox(height: 44),
                    TypesSection(state.sections),
                    const SizedBox(height: 20),

                  ],
                ),
              );
            }
            else if(state is StorageDetailsFailureState){
              return Center(
                child: Text(
                  state.errorMessage,
                  style: StyleManager.smallTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeightManager.normalWeight,
                  ),
                ),
              );
            }
            else{
              return const LoadingState(color: ColorManager.blueColor);
            }

          },
        )
    ),);
  }
}

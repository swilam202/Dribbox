import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color manager.dart';
import '../../../../core/resources/font weight manager.dart';
import '../../../../core/resources/style manager.dart';
import '../../../../core/utils/calculate size.dart';
import '../../../../core/widgets/custom drawer.dart';
import '../../../../core/widgets/loading state.dart';
import '../controller/storage details cubit.dart';
import '../controller/storage details state.dart';
import '../widgets/chart section.dart';
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
    return CustomDrawer(
      child: Scaffold(
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
        body: BlocBuilder<StorageDetailsCubit, StorageDetailsState>(
          builder: (context, state) {
            if (state is StorageDetailsSuccessState) {
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
            } else if (state is StorageDetailsFailureState) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: StyleManager.smallTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeightManager.normalWeight,
                  ),
                ),
              );
            } else {
              return const LoadingState(color: ColorManager.blueColor);
            }
          },
        ),
      ),
    );
  }
}

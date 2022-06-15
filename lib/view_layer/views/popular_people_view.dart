import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadio_task/controller_layer/popular_people_provider.dart';
import 'package:squadio_task/view_layer/helpers/popular_people_card.dart';
import '../../global_helpers/common_error_message.dart';
import '../../global_helpers/common_loader.dart';
import '../../global_helpers/empty_data_message.dart';

class PopularPeopleView extends StatefulWidget {
  const PopularPeopleView({Key? key}) : super(key: key);

  @override
  State<PopularPeopleView> createState() => _PopularPeopleViewState();
}

class _PopularPeopleViewState extends State<PopularPeopleView> {
  Future? future;
  ScrollController scrollOrderController = ScrollController();
  Future<void> prepareData() async{
   await context.read<PopularPeopleProvider>().getPopularPeople();
  }

  @override
  void initState() {
    future=prepareData();
    super.initState();
    scrollOrderController.addListener(() async {
      int page =1;
      var popularPeopleProvider = Provider.of<PopularPeopleProvider>(context, listen: false);
      if (scrollOrderController.position.pixels == scrollOrderController.position.maxScrollExtent) {
          page++;
          popularPeopleProvider.changePaginationLoading(true);
          await popularPeopleProvider.getPaginationPopularPeople(page);
          popularPeopleProvider.changePaginationLoading(false);
      }
    });
  }
  @override
  void dispose() {
    scrollOrderController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CommonLoader();
            } else {
              return Consumer<PopularPeopleProvider>(
                builder: (context, popularPeopleProvider, child) {
                  return ListView.builder(
                    controller: scrollOrderController,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    itemCount: popularPeopleProvider.popularPeopleModel.results?.length,
                    itemBuilder: (context, index) {
                      return PopularPeopleCard(
                        model: popularPeopleProvider.popularPeopleModel.results?[index],
                      );
                    },
                  );
                },
              );
              if (snapshot.hasError) {
                // return  Text(snapshot.error.toString());
                return const CommonErrorMessage();
              } else {}
            }
          },
        ),
      ),
    );
  }
}
// popularPeopleProvider.popularPeopleModel.results?.isEmpty
// ? const EmptyDataMessage()
// :

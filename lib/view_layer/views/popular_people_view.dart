import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadio_task/controller_layer/popular_people_provider.dart';
import 'package:squadio_task/view_layer/helpers/popular_people_card.dart';
import '../../global_helpers/common_error_message.dart';
import '../../global_helpers/common_loader.dart';
import '../../global_helpers/empty_data_message.dart';

class PopularPeopleView extends StatefulWidget {
  const PopularPeopleView({Key key}) : super(key: key);

  @override
  State<PopularPeopleView> createState() => _PopularPeopleViewState();
}

class _PopularPeopleViewState extends State<PopularPeopleView> {
  Future future;
  ScrollController _controller;

  Future<void> prepareData() async {
    await context.read<PopularPeopleProvider>().getPopularPeople();
  }

  @override
  void initState() {
    future = prepareData();
    _controller = ScrollController()
      ..addListener(() async {
        var popularPeopleProvider = Provider.of<PopularPeopleProvider>(context, listen: false);
        int page = popularPeopleProvider.page;
        if (_controller.position.pixels == _controller.position.maxScrollExtent) {
          if (page < popularPeopleProvider.popularPeopleModel.totalPages) {
            await popularPeopleProvider.getPaginationPopularPeople();
          }
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'TMDB',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff08B5E0),
                ),
              ),
            ),
            FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                    child: CommonLoader(),
                  );
                } else {
                  if (snapshot.hasError) {
                    return const CommonErrorMessage();
                  } else {
                    return Consumer<PopularPeopleProvider>(
                      builder: (context, popularPeopleProvider, child) {
                        return popularPeopleProvider
                                .popularPeopleModel.results.isEmpty
                            ? const EmptyDataMessage()
                            : Expanded(
                                child: Stack(
                                  children: [
                                    ListView.builder(
                                      key: const Key('infinite_scroll_list'),
                                      controller: _controller,
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      itemCount: popularPeopleProvider.popularPeopleModel.results.length,
                                      itemBuilder: (context, index) {
                                        return PopularPeopleCard(
                                          key: Key('card_$index'),
                                          model: popularPeopleProvider.popularPeopleModel.results[index],
                                        );
                                      },
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: popularPeopleProvider.isPaginationLoading
                                          ? const SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: CommonLoader())
                                          : const SizedBox(),
                                    )
                                  ],
                                ),
                              );
                      },
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:squadio_task/controller_layer/popular_people_provider.dart';
import 'package:squadio_task/main.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('test if list view is rendered', (tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          tester.runAsync(() async {
            await context.read<PopularPeopleProvider>().getPopularPeople();
            const testKey = Key('infinite_scroll_list');
            await tester.pumpWidget(const MyApp());
            expect(find.byKey(testKey), findsOneWidget);
          });
          return const SizedBox();
        },
      ),
    );
  });
  testWidgets('test infinite scroll', (tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          tester.runAsync(() async {
            await context.read<PopularPeopleProvider>().getPopularPeople();
            const testKey = Key('infinite_scroll_list');
            await tester.drag(find.byKey(testKey), const Offset(0.0, -300));
            await tester.pumpWidget(const MyApp());
            expect(find.byKey(testKey), findsOneWidget);
          });
          return const SizedBox();
        },
      ),
    );
  });
  testWidgets('test if list cards are rendered', (tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          tester.runAsync(() async {
            await context.read<PopularPeopleProvider>().getPopularPeople();
            const testKey = Key('card_10');
            await tester.pumpWidget(const MyApp());
            expect(find.byKey(testKey), findsOneWidget);
          });
          return const SizedBox();
        },
      ),
    );
  });

  testWidgets('test if list cards are rendered', (tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          tester.runAsync(() async {
            await context.read<PopularPeopleProvider>().getPopularPeople();
            const testKey = Key('card_10');
            await tester.pumpWidget(const MyApp());
            expect(find.byKey(testKey), findsOneWidget);
          });
          return const SizedBox();
        },
      ),
    );
  });
  testWidgets('test if gridView is rendered', (tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          tester.runAsync(() async {
            await context.read<PopularPeopleProvider>().getPopularPeople();
            const testKey = Key('grid_view');
            await tester.pumpWidget(const MyApp());
            expect(find.byKey(testKey), findsOneWidget);
          });
          return const SizedBox();
        },
      ),
    );
  });

  testWidgets('test if list cards are rendered', (tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          tester.runAsync(() async {
            await context.read<PopularPeopleProvider>().getPopularPeople();
            const testKey = Key('grid_view_card');
            await tester.pumpWidget(const MyApp());
            expect(find.byKey(testKey), findsOneWidget);
          });
          return const SizedBox();
        },
      ),
    );
  });
  testWidgets('test if list cards are rendered', (tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          tester.runAsync(() async {
            await context.read<PopularPeopleProvider>().getPopularPeople();
            const testKey = Key('full_size_image');
            await tester.pumpWidget(const MyApp());
            expect(find.byKey(testKey), findsOneWidget);
          });
          return const SizedBox();
        },
      ),
    );
  });
}

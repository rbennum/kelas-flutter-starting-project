import 'package:auto_route/auto_route.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: DummyUIRoute.page),
    AutoRoute(page: DummyUIListRoute.page),
    AutoRoute(page: CounterRoute.page),
    AutoRoute(page: InputValidationRoute.page),
    AutoRoute(page: SimpleCalculatorRoute.page),
    AutoRoute(page: ToDoRoute.page),
    AutoRoute(page: NewsRoute.page),
    AutoRoute(page: NewsPopularRoute.page),
    AutoRoute(page: NewsTopStorySectionRoute.page),
    AutoRoute(page: NewsTopStoryRoute.page),
    AutoRoute(page: NewsDetailRoute.page),
  ];
}

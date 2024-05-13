// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:student_lecture_app/presentation/pages/counter/counter_page.dart'
    as _i1;
import 'package:student_lecture_app/presentation/pages/dummy_ui/dummy_ui_page.dart'
    as _i3;
import 'package:student_lecture_app/presentation/pages/dummy_ui_2/dummy_ui_list_page.dart'
    as _i2;
import 'package:student_lecture_app/presentation/pages/splash/splash_page.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    CounterRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CounterPage(),
      );
    },
    DummyUIListRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DummyUIListPage(),
      );
    },
    DummyUIRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DummyUIPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CounterPage]
class CounterRoute extends _i5.PageRouteInfo<void> {
  const CounterRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DummyUIListPage]
class DummyUIListRoute extends _i5.PageRouteInfo<void> {
  const DummyUIListRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DummyUIListRoute.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIListRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DummyUIPage]
class DummyUIRoute extends _i5.PageRouteInfo<void> {
  const DummyUIRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DummyUIRoute.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

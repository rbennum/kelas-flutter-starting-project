// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:student_lecture_app/presentation/pages/counter/counter_page.dart'
    as _i1;
import 'package:student_lecture_app/presentation/pages/dummy_ui/dummy_ui_page.dart'
    as _i3;
import 'package:student_lecture_app/presentation/pages/dummy_ui_2/dummy_ui_list_page.dart'
    as _i2;
import 'package:student_lecture_app/presentation/pages/input_validation/input_validation_page.dart'
    as _i4;
import 'package:student_lecture_app/presentation/pages/splash/splash_page.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CounterRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CounterPage(),
      );
    },
    DummyUIListRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DummyUIListPage(),
      );
    },
    DummyUIRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DummyUIPage(),
      );
    },
    InputValidationRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.InputValidationPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CounterPage]
class CounterRoute extends _i6.PageRouteInfo<void> {
  const CounterRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DummyUIListPage]
class DummyUIListRoute extends _i6.PageRouteInfo<void> {
  const DummyUIListRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DummyUIListRoute.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIListRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DummyUIPage]
class DummyUIRoute extends _i6.PageRouteInfo<void> {
  const DummyUIRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DummyUIRoute.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.InputValidationPage]
class InputValidationRoute extends _i6.PageRouteInfo<void> {
  const InputValidationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          InputValidationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputValidationRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:student_lecture_app/presentation/pages/calculator/simple_calculator_page.dart'
    as _i9;
import 'package:student_lecture_app/presentation/pages/counter/counter_page.dart'
    as _i1;
import 'package:student_lecture_app/presentation/pages/dummy_ui/dummy_ui_page.dart'
    as _i3;
import 'package:student_lecture_app/presentation/pages/dummy_ui_2/dummy_ui_list_page.dart'
    as _i2;
import 'package:student_lecture_app/presentation/pages/input_validation/input_validation_page.dart'
    as _i4;
import 'package:student_lecture_app/presentation/pages/news/news_page.dart'
    as _i5;
import 'package:student_lecture_app/presentation/pages/news/news_popular_page.dart'
    as _i6;
import 'package:student_lecture_app/presentation/pages/news/news_top_story_page.dart'
    as _i7;
import 'package:student_lecture_app/presentation/pages/news/news_top_story_section_page.dart'
    as _i8;
import 'package:student_lecture_app/presentation/pages/splash/splash_page.dart'
    as _i10;
import 'package:student_lecture_app/presentation/pages/to_do/to_do_page.dart'
    as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    CounterRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CounterPage(),
      );
    },
    DummyUIListRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DummyUIListPage(),
      );
    },
    DummyUIRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DummyUIPage(),
      );
    },
    InputValidationRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.InputValidationPage(),
      );
    },
    NewsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NewsPage(),
      );
    },
    NewsPopularRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.NewsPopularPage(),
      );
    },
    NewsTopStoryRoute.name: (routeData) {
      final args = routeData.argsAs<NewsTopStoryRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.NewsTopStoryPage(
          key: args.key,
          section: args.section,
        ),
      );
    },
    NewsTopStorySectionRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.NewsTopStorySectionPage(),
      );
    },
    SimpleCalculatorRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SimpleCalculatorPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SplashPage(),
      );
    },
    ToDoRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ToDoPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CounterPage]
class CounterRoute extends _i12.PageRouteInfo<void> {
  const CounterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DummyUIListPage]
class DummyUIListRoute extends _i12.PageRouteInfo<void> {
  const DummyUIListRoute({List<_i12.PageRouteInfo>? children})
      : super(
          DummyUIListRoute.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIListRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DummyUIPage]
class DummyUIRoute extends _i12.PageRouteInfo<void> {
  const DummyUIRoute({List<_i12.PageRouteInfo>? children})
      : super(
          DummyUIRoute.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.InputValidationPage]
class InputValidationRoute extends _i12.PageRouteInfo<void> {
  const InputValidationRoute({List<_i12.PageRouteInfo>? children})
      : super(
          InputValidationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputValidationRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NewsPage]
class NewsRoute extends _i12.PageRouteInfo<void> {
  const NewsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.NewsPopularPage]
class NewsPopularRoute extends _i12.PageRouteInfo<void> {
  const NewsPopularRoute({List<_i12.PageRouteInfo>? children})
      : super(
          NewsPopularRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsPopularRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.NewsTopStoryPage]
class NewsTopStoryRoute extends _i12.PageRouteInfo<NewsTopStoryRouteArgs> {
  NewsTopStoryRoute({
    _i13.Key? key,
    required String section,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          NewsTopStoryRoute.name,
          args: NewsTopStoryRouteArgs(
            key: key,
            section: section,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsTopStoryRoute';

  static const _i12.PageInfo<NewsTopStoryRouteArgs> page =
      _i12.PageInfo<NewsTopStoryRouteArgs>(name);
}

class NewsTopStoryRouteArgs {
  const NewsTopStoryRouteArgs({
    this.key,
    required this.section,
  });

  final _i13.Key? key;

  final String section;

  @override
  String toString() {
    return 'NewsTopStoryRouteArgs{key: $key, section: $section}';
  }
}

/// generated route for
/// [_i8.NewsTopStorySectionPage]
class NewsTopStorySectionRoute extends _i12.PageRouteInfo<void> {
  const NewsTopStorySectionRoute({List<_i12.PageRouteInfo>? children})
      : super(
          NewsTopStorySectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsTopStorySectionRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SimpleCalculatorPage]
class SimpleCalculatorRoute extends _i12.PageRouteInfo<void> {
  const SimpleCalculatorRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SimpleCalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'SimpleCalculatorRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ToDoPage]
class ToDoRoute extends _i12.PageRouteInfo<void> {
  const ToDoRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ToDoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ToDoRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

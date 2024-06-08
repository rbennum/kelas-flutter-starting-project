import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_lecture_app/application/counter/counter_cubit.dart';
import 'package:student_lecture_app/application/counter/counter_state.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

@RoutePage()
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  static const keyFABIncrement = Key("fab_increment");
  static const keyFABDecrement = Key("fab_decrement");
  static const keyTextCounter = Key("text_counter");

  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text(
              state.entity.counter.toString(),
              key: keyTextCounter,
            );
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment;
            },
            heroTag: null,
            key: keyFABIncrement,
            child: const Icon(Icons.add),
          ),
          UIHelper.verticalSpace(10),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrement;
            },
            heroTag: null,
            key: keyFABDecrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

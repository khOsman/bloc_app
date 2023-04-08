import 'package:bloc_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Text style
    final txtStyle = TextStyle(fontSize: 60, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cubit Counter App",

        ),
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: ((context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               Text((context.read<CounterCubit>().counter.toString()),style: txtStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterCubit>().counterIncrease();
                      },
                      child: Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterCubit>().counterReset();
                      },
                      child: Icon(Icons.loop),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterCubit>().counterDecrease();
                      },
                      child: Icon(Icons.remove),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

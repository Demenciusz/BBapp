import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shake/shake.dart';
import 'package:zaliczenie/cubit/dice/dice_cubit.dart';
import 'package:zaliczenie/domain/mean_field_manager.dart';
import 'package:zaliczenie/pages/4dicePage/widgets/dice_type.dart';
import 'package:zaliczenie/pages/widgets/drawer.dart';
import 'package:zaliczenie/pages/widgets/textbutton.dart';

class DicePage extends StatefulWidget {
  DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage>
    with SingleTickerProviderStateMixin {
  late final ShakeDetector detector;
  late MeanFieldManager meanFieldManager;
  late AnimationController controller;
  int diceValue = 0;

  CurrentDice currentDice = CurrentDice.k4;
  @override
  void initState() {
    super.initState();
    meanFieldManager = MeanFieldManager();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        print('eeee');
        BlocProvider.of<DiceCubit>(context).emit(DiceAnimation());
      },
      shakeSlopTimeMS: 1000,
    );
    controller = AnimationController(vsync: this);
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        diceValue = meanFieldManager.diceValue(currentDice);
        BlocProvider.of<DiceCubit>(context).emit(DiceInitial(currentDice));
      }
    });
  }

  @override
  void dispose() {
    detector.stopListening();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      drawer: MyDrawer(),
      body: BlocBuilder<DiceCubit, DiceState>(
        builder: (context, state) {
          return state is DiceInitial
              ? Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
                          children: [
                            DiceType(
                                diceTypeText: 'k4',
                                currentDice: BlocProvider.of<DiceCubit>(context)
                                    .takeCurrentDiceValue
                                    .toString(),
                                function: () {
                                  BlocProvider.of<DiceCubit>(context)
                                      .changeDice('k4');
                                  currentDice = CurrentDice.k4;
                                }),
                            DiceType(
                                diceTypeText: 'k6',
                                currentDice: BlocProvider.of<DiceCubit>(context)
                                    .takeCurrentDiceValue
                                    .toString(),
                                function: () {
                                  BlocProvider.of<DiceCubit>(context)
                                      .changeDice('k6');
                                  currentDice = CurrentDice.k6;
                                }),
                            DiceType(
                                diceTypeText: 'k8',
                                currentDice: BlocProvider.of<DiceCubit>(context)
                                    .takeCurrentDiceValue
                                    .toString(),
                                function: () {
                                  BlocProvider.of<DiceCubit>(context)
                                      .changeDice('k8');
                                  currentDice = CurrentDice.k8;
                                }),
                            DiceType(
                                diceTypeText: 'k10',
                                currentDice: BlocProvider.of<DiceCubit>(context)
                                    .takeCurrentDiceValue
                                    .toString(),
                                function: () {
                                  BlocProvider.of<DiceCubit>(context)
                                      .changeDice('k10');
                                  currentDice = CurrentDice.k10;
                                }),
                            DiceType(
                                diceTypeText: 'k12',
                                currentDice: BlocProvider.of<DiceCubit>(context)
                                    .takeCurrentDiceValue
                                    .toString(),
                                function: () {
                                  BlocProvider.of<DiceCubit>(context)
                                      .changeDice('k12');
                                  currentDice = CurrentDice.k12;
                                }),
                            DiceType(
                                diceTypeText: 'k20',
                                currentDice: BlocProvider.of<DiceCubit>(context)
                                    .takeCurrentDiceValue
                                    .toString(),
                                function: () {
                                  BlocProvider.of<DiceCubit>(context)
                                      .changeDice('k20');
                                  currentDice = CurrentDice.k20;
                                }),
                            DiceType(
                                diceTypeText: 'k100',
                                currentDice: BlocProvider.of<DiceCubit>(context)
                                    .takeCurrentDiceValue
                                    .toString(),
                                function: () {
                                  BlocProvider.of<DiceCubit>(context)
                                      .changeDice('k100');
                                  currentDice = CurrentDice.k100;
                                }),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            diceValue.toString(),
                            style: TextStyle(
                              fontSize: 80,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Średnia dla wybranej kości: ' +
                                meanFieldManager
                                    .rollMean(currentDice)
                                    .toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            meanFieldManager.rollList(currentDice),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        MyTextButton(
                            screenWidth: MediaQuery.of(context).size.width,
                            onPressed: () {
                              BlocProvider.of<DiceCubit>(context)
                                  .emit(DiceAnimation());
                            },
                            content: 'Rzuć Kością')
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Lottie.asset(
                    'assets/diceanimation.json',
                    controller: controller,
                    onLoaded: (p0) {
                      controller
                        ..duration = p0.duration
                        ..reset()
                        ..forward().whenComplete(() {
                          BlocProvider.of<DiceCubit>(context)
                              .emit(DiceInitial(currentDice));
                        });
                    },
                  ),
                );
        },
      ),
    );
  }
}

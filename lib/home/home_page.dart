import 'dart:math';
import 'package:etch_a_sketch_like/home/home_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wheel_spinner/wheel_spinner.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double x = 0;
    double y = 0;

    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider.value(
        value: HomeModel()..addFrame([]),
        child: Consumer<HomeModel>(builder: (context, model, chidl) {
          x = model.x * 0.01;
          y = model.y * -0.01;
          return Scaffold(
              body: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                color: const Color.fromARGB(255, 181, 23, 12),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.72,
                              width: size.width * 0.62,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 204, 204, 204),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: size.height * 0.7,
                          width: size.width * 0.6,
                          child: Stack(
                            children: [
                              Stack(
                                children: model.dots,
                              ),
                            ],
                          )),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Swipe A Sketch',
                                  style: GoogleFonts.grapeNuts(fontSize: 60),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(221, 255, 191, 1),
                                    elevation: 10,
                                    shape: const StadiumBorder(),
                                  ),
                                  onPressed: () {
                                    model.rest(Container(
                                        decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 204, 204, 204),
                                      borderRadius: BorderRadius.circular(20),
                                    )));
                                  },
                                  child: Text(
                                    'Reset',
                                    style: GoogleFonts.grapeNuts(
                                        fontSize: 30,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 150)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 60,
                                height: 200,
                                child: WheelSpinnerTheme(
                                  data: WheelSpinnerThemeData.light().copyWith(
                                    borderRadius: BorderRadius.circular(10),
                                    dividerColor: Colors.black,
                                  ),
                                  child: WheelSpinner(
                                    value: model.x,
                                    min: -100,
                                    max: 100,
                                    onSlideUpdate: (val) {
                                      model.changeValueX(val);
                                      model.addDot(x, y);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: SizedBox(
                                    width: 60,
                                    height: 200,
                                    child: WheelSpinnerTheme(
                                      data: WheelSpinnerThemeData.light()
                                          .copyWith(
                                        borderRadius: BorderRadius.circular(10),
                                        dividerColor: Colors.black,
                                      ),
                                      child: WheelSpinner(
                                        value: model.y,
                                        min: -100,
                                        max: 100,
                                        onSlideUpdate: (val) {
                                          model.changeValueY(val);
                                          model.addDot(x, y);
                                        },
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ));
        }));
  }
}

import 'package:best_design/widgets/Animation/skelton_animation.dart';
import 'package:flutter/material.dart';

class SkeltonLaoding extends StatelessWidget {
  const SkeltonLaoding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Skelton(
                    width: double.infinity,
                    height: 180,
                  ),
                  Positioned(
                    bottom: -50,
                    child: Skelton(
                      width: 280,
                      height: 80,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 85,
              ),
              Column(
                  children: List.generate(
                      5,
                      (index) => Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: Stack(
                              alignment: Alignment.topLeft,
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 20),
                                  child: Skelton(
                                      width: double.infinity, height: 140),
                                ),
                                Positioned(
                                    top: -20,
                                    bottom: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Skelton(width: 140, height: 150),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                      ],
                                    )),
                                Positioned(
                                  left: 150,
                                  top: 20,
                                  child: Column(
                                    children: [
                                      Skelton(width: 150, height: 10),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Skelton(width: 150, height: 10),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Skelton(width: 150, height: 10),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    left: 150,
                                    top: 120,
                                    child: Skelton(width: 150, height: 10)),
                              ],
                            ),
                          ))),
            ],
          ),
        ),
      ),
    );
  }
}

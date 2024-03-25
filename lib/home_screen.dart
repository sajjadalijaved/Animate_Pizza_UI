import 'package:flutter/material.dart';
import 'package:pizza_animation/model/pizza_model.dart';
import 'package:pizza_animation/widgets/order_button.dart';
import 'package:pizza_animation/widgets/pizza_details.dart';
import 'package:pizza_animation/widgets/pizza_size.dart';

import 'widgets/bottom_rounded_clipper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _titleController;
  late PageController _imageSlideController;
  late PageController _detailsSlideController;
  @override
  void initState() {
    super.initState();
    _titleController = PageController();
    _imageSlideController = PageController(viewportFraction: 0.70);
    _detailsSlideController = PageController();
    Future.delayed(const Duration(milliseconds: 100), () {
      _imageSlideController.animateToPage(1,
          duration: const Duration(milliseconds: 400), curve: Curves.linear);
    });
    _imageSlideController.addListener(() {
      _titleController.jumpTo(_imageSlideController.offset * 0.148);
      _detailsSlideController.jumpTo(_imageSlideController.offset * 0.5621);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _imageSlideController.dispose();
    _detailsSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // clipper
                ClipPath(
                  clipper: BottomRoundedClipper(),
                  child: Container(
                    width: width,
                    height: 450,
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/images/menu.png",
                            width: 32,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // pizza name pageview
                      SizedBox(
                        height: 45,
                        child: PageView.builder(
                          controller: _titleController,
                          itemCount: pizzaList.length,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Text(
                              pizzaList[index].name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            );
                          },
                        ),
                      ),
                      // pizza image pageview
                      SizedBox(
                        height: 320,
                        child: AnimatedBuilder(
                          animation: _imageSlideController,
                          builder: (context, child) => PageView.builder(
                            itemCount: pizzaList.length,
                            controller: _imageSlideController,
                            onPageChanged: (page) {},
                            itemBuilder: (context, index) {
                              double value = 0.0;
                              if (_imageSlideController
                                  .position.haveDimensions) {
                                value = index.toDouble() -
                                    (_imageSlideController.page ?? 0);
                                value = (value * 0.7).clamp(-1, 1);
                              }
                              return Align(
                                alignment: Alignment.topCenter,
                                child: Transform.translate(
                                  offset: Offset(
                                    0,
                                    10 + (value.abs() * 40),
                                  ),
                                  child: Transform.rotate(
                                    angle: value * 5,
                                    child: Image.asset(
                                      pizzaList[index].image,
                                      width: width,
                                      height: 310,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                      animation: _detailsSlideController,
                      builder: (context, child) {
                        return SizedBox(
                          height: 170,
                          child: PageView.builder(
                            itemCount: pizzaList.length,
                            controller: _detailsSlideController,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              double value = 0.0;

                              if (_detailsSlideController
                                  .position.haveDimensions) {
                                value = index.toDouble() -
                                    (_detailsSlideController.page ?? 0);
                                value = (value * 0.9);
                              }
                              return Opacity(
                                opacity: 1 - value.abs(),
                                child:
                                    PizzaDetails(pizzadetail: pizzaList[index]),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const PizzaSize(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: const OrderButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

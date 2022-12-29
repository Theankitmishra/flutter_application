import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/cubit/app_cubit_states.dart';
import 'package:flutter_application/cubit/app_cubits.dart';
import 'package:flutter_application/widgets/app_buttons.dart';
import 'package:flutter_application/widgets/app_large_text.dart';
import 'package:flutter_application/widgets/app_text.dart';
import 'package:flutter_application/widgets/responsive_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: ((context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/" +
                                  detail.place.img),
                          fit: BoxFit.cover)),
                )),
                Positioned(
                    left: 20,
                    top: 50,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: (() {
                            BlocProvider.of<AppCubits>(context).goHome();
                          }),
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        )
                      ],
                    )),
                Positioned(
                    top: 320,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 550,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: detail.place.name,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              AppLargeText(
                                text: "\$" + detail.place.price.toString(),
                                color: Color.fromARGB(255, 1, 28, 28),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color.fromARGB(255, 1, 28, 28),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: detail.place.location,
                                color: Color.fromARGB(255, 8, 80, 94),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(Icons.star,
                                    color: index < detail.place.stars
                                        ? Color.fromARGB(255, 195, 186, 7)
                                        : Colors.grey);
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: "(5.0)",
                              color: Color.fromARGB(255, 8, 80, 94),
                            )
                          ]),
                          SizedBox(
                            height: 25,
                          ),
                          AppLargeText(
                            text: "People",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text: "Number of people in your group",
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Wrap(
                              children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  size: 50,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundcolor: selectedIndex == index
                                      ? Colors.black
                                      : Color.fromARGB(17, 98, 172, 168),
                                  bordercolor: selectedIndex == index
                                      ? Colors.black
                                      : Color.fromARGB(17, 98, 172, 168),
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          })),
                          SizedBox(
                            height: 20,
                          ),
                          AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppText(
                            text: detail.place.description,
                            color: Colors.black.withOpacity(0.5),
                          )
                        ],
                      ),
                    )),
                Positioned(
                    left: 20,
                    bottom: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButtons(
                          size: 60,
                          color: Colors.black.withOpacity(0.4),
                          backgroundcolor: Colors.white,
                          bordercolor: Colors.black.withOpacity(0.4),
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ResponsiveButton(
                          isResponsive: true,
                        ),
                      ],
                    ))
              ],
            )),
      );
    }));
  }
}

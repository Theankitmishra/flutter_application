import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/cubit/app_cubit_states.dart';
import 'package:flutter_application/cubit/app_cubits.dart';
import 'package:flutter_application/widgets/app_large_text.dart';
import 'package:flutter_application/widgets/app_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var image = {
    "ballooning.png": "Ballooning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkeling.png": "Snorkeling"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Column(
            children: [
              //menu text
              Container(
                padding: EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  children: [
                    Icon(Icons.menu, size: 30, color: Colors.black54),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              //discover text
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppLargeText(text: "Discover"),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              //tabbar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      controller: _tabController,
                      labelColor: Colors.black,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(
                          color: Color.fromARGB(255, 1, 28, 28), radius: 4),
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "Places"),
                        Tab(text: "Inspiration"),
                        Tab(text: "Emotions"),
                      ]),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context)
                              .detailPage(info[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/" +
                                          info[index].img),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    },
                  ),
                  Text("There"),
                  Text("Bye")
                ]),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: "Explore more",
                      size: 22,
                    ),
                    AppText(
                      text: "see all",
                      color: Color.fromARGB(255, 8, 80, 94),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 120,
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 20),
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              //margin: const EdgeInsets.only(right: 50,),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/" +
                                          image.keys.elementAt(index)),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: AppText(
                                  text: image.values.elementAt(index),
                                  color: Color.fromARGB(255, 8, 80, 94)),
                            )
                          ],
                        ),
                      );
                    })),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

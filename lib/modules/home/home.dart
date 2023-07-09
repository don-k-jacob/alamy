import 'package:alamy/models/searchModel.dart';
import 'package:alamy/services/getImages.dart';
import 'package:alamy/widgets/glass_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> images = [
  "https://images.unsplash.com/photo-1688764896399-4ed6b6ecea0b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1688658179201-4d99ab1546e9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1682695796795-cc287af78a2b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1688607931885-9669e17ea963?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1688744658744-4653067fc459?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1688764896036-15de68a6dcd1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1688777147321-668bd72f4f96?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0OHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
  "https://images.unsplash.com/photo-1688736009784-9d3cb2b3dedd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0OXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
];

class _HomePageState extends State<HomePage> {
  List<ImageList> imagesList = [];
  int page = 1;
  TextEditingController searchController = TextEditingController();
  getImages({String? keyword}) async {
    imagesList = [];
    setState(() {});
    if (keyword == null) {
      imagesList = await fetchData();
    } else {
      imagesList = await fetchSearchData(keyword: keyword);
    }
    print(imagesList.length);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/don.gif"),
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
        )),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.9),
          ),
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 170,
              title: Column(
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 40.0,
                      color: Color(0xff6597CD),
                      fontWeight: FontWeight.bold,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('Alamy!'),
                      ],
                      isRepeatingAnimation: true,
                      repeatForever: true,
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                  // Text("Alamy!",
                  //     style: TextStyle(
                  //       color: Color(0xff6597CD),
                  //       fontSize: 30,
                  //       fontWeight: FontWeight.bold,
                  //     )),
                  SizedBox(
                      width: size.width - 60,
                      height: 70,
                      child: GlassEffect(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: size.width / 1.6,
                              child: TextField(
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                controller: searchController,
                                decoration: InputDecoration(
                                  label: SizedBox(
                                    width: 250.0,
                                    child: DefaultTextStyle(
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                      ),
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          TypewriterAnimatedText('Search'),
                                          TypewriterAnimatedText(
                                              'Find your perfect image!'),
                                          TypewriterAnimatedText(
                                              'Type anything!'),
                                          TypewriterAnimatedText(
                                              'Search for free!'),
                                        ],
                                        onTap: () {
                                          print("Tap Event");
                                        },
                                      ),
                                    ),
                                  ),
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                getImages();
                              },
                              icon: SizedBox(
                                  child: Lottie.asset(
                                      'assets/52102-searching.json')),
                            )
                          ],
                        ),
                      )),
                  Row(
                    children: [
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: RefreshIndicator(
              displacement: 200,
              onRefresh: () => getImages(),
              child: MasonryGridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemBuilder: (context, index) {
                  return imagesList.isEmpty
                      ? SizedBox(
                          child: Shimmer.fromColors(
                            baseColor: Colors.white.withOpacity(0.2),
                            highlightColor: Colors.transparent,
                            child: Tile(
                              index: index,
                              extent: (index % 5 + 1) * 100,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shadowColor: null,
                                    backgroundColor: Colors.transparent,
                                    content: Hero(
                                      tag: images[index % images.length],
                                      child: GlassEffect(
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Stack(
                                            children: [
                                              Image.network(
                                                images[index % images.length],
                                                fit: BoxFit.cover,
                                              ),
                                              Positioned(
                                                right: 0,
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: GlassEffect(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Lottie.asset(
                                                          'assets/91134-download.json',
                                                          height: 20,
                                                          width: 20,
                                                          fit: BoxFit.cover),
                                                    ),
                                                    isOval: true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Hero(
                            tag: images[index % images.length],
                            child: Tile(
                              index: index,
                              extent: (index % 5 + 2) * 100,
                            ),
                          ),
                        );
                },
              ),
            ),
            // This trailing comma makes auto-formatting nicer for build methods.
          ),
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = GlassEffect(
        child: Image.network(
      images[index % images.length],
      fit: BoxFit.contain,
    ));

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}

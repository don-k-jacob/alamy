import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 120,
        title: Column(
          children: [
            Text("Alamy!",
                style: TextStyle(
                  color: Color(0xff6597CD),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              width: size.width - 60,
              height: 55,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xff1E1E1E),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: size.width/1.5,
                      child: TextField(
                        
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          hintText: "Search",
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
                      onPressed: () {},
                      icon: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Color(0xff489BFE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: MasonryGridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return Tile(
            index: index,
            extent: (index % 5 + 1) * 100,
          );
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
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
    final child = Container(
      decoration: BoxDecoration(
        color: backgroundColor ??
            Colors.primaries[index % Colors.primaries.length],
        borderRadius: BorderRadius.circular(10),
      ),
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

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

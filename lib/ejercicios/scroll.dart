import 'package:flutter/cupertino.dart';

class MiScrollApp extends StatelessWidget
{
  const MiScrollApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return const CupertinoApp(
      home: HomeScroll(),
      title: 'Scroll App',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemIndigo,
        brightness: Brightness.light
        ),
        debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScroll extends StatelessWidget 
{
  const HomeScroll({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context)
  {
    double screenWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Scroll App"),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(100, (index) => Text("Elemento $index"))
              ],
            ),
          ),
        )
      )
    );
  }
}
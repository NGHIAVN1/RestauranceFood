import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:main/components/banner.dart';
import 'package:main/components/circlectalog.dart';
import 'package:main/screens/login.dart';
import 'package:main/components/popularfood.dart';
import 'package:theme_provider/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeMode _themeMode = ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    var controller = ThemeProvider.controllerOf(context);
    // Switch mode light and dark
    void _toggleTheme(bool isOn) {
      setState(() {
        _themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
      });
      return controller.nextTheme();
    }

    AppTheme customTheme() {
      return AppTheme(
          id: 'customTheme',
          data: ThemeData(
            useMaterial3: true,
          ),
          description: 'This is custom theme');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home page'),
        leading: Container(
          child: Tab(
            icon: Image.asset('assets/images/logo-homepage.png'),
          ),
        ),
        // flexibleSpace: Icon(Icons.photo_camera, size: 75.0,),
        actions: [
          // Container(
          //   child: Icon(Icons.account_box_outlined),

          // )
          Switch(
            value: _themeMode == ThemeMode.light,
            onChanged: _toggleTheme,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(right: 10.0)),
              Container(
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    icon: Icon(Icons.account_box_rounded)),
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // This is location Catalogue
            Container(
                color: const Color.fromARGB(77, 128, 119, 119),
                height: 150,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CircleCatalog();
                    })),
            // This is locate Banner
            Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, item) {
                      return BannerList();
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: const Text(
                    'Popular Food',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: Icon(
                      Icons.arrow_circle_right
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, item) {
                return PopularFood();
              }),
            )
          ],
        ),
      ),
    bottomNavigationBar: BottomNavigationBar(
      items: const [
         BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search'
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart), 
          label: "Cart"
        )
      ])
    );
  }
}

class _builderHonrizontalRow extends StatelessWidget {
  const _builderHonrizontalRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 60,
          width: 40,
          color: Colors.black,
        ),
        Container(
          height: 60,
          width: 40,
          color: Colors.yellow,
        ),
        Container(
          height: 60,
          width: 40,
          color: Colors.green,
        ),
        Container(
          height: 60,
          width: 40,
          color: Colors.orange,
        )

        //   Container(
        //     padding: EdgeInsets.all(8.0),
        //     decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(100),
        //     border: Border.all(
        //             width: 2, color: Color.fromARGB(255, 22, 22, 22)),
        //             ),
        //   child: Icon(Icons.abc_rounded),
        //   height: 60.0,
        //   width: 60.0,
        //   ),
        // Padding(padding:
        // EdgeInsets.all(8.0)
        // ),
        // Container(

        //   color: Colors.green,
        //   height: 40.0,
        //   width: 60.0,
        // ),

        // Padding(padding: EdgeInsets.all(16.0)),
        // Expanded(
        //     child: Container(
        //   color: Colors.red,
        //   height: 40.0,
        //   width: 60.0,
        // )),
        // Padding(padding: EdgeInsets.all(16.0)),
        // Container(
        //   color: Colors.green,
        //   height: 40.0,
        //   width: 60.0,
        // ),
      ],
    );
  }
}

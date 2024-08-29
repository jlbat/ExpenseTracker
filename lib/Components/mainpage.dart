import 'package:alert_banner/exports.dart';
import 'package:expense_tracker/Authentication/login.dart';
import 'package:expense_tracker/Components/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Common/alertBanner.dart';
import '../Authentication/authService.dart';

class Mainpage extends StatefulWidget {
  static String id = 'main';
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color(0x9E9E9EFF),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.bar_chart)),
            label: 'Statistics',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const Home(),
        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: AnnotatedRegion(
              value: SystemUiOverlayStyle(
                statusBarColor: Color(0x9E9E9EFF),
                statusBarIconBrightness: Brightness.dark,
              ),
              child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.notifications_sharp),
                          title: Text('Notification 1'),
                          subtitle: Text('This is a notification'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.notifications_sharp),
                          title: Text('Notification 2'),
                          subtitle: Text('This is a notification'),
                        ),
                      ),
                    ],
                  ),
              )
          ),
        ),

        /// Profile
        Padding(
          padding: EdgeInsets.all(8.0),
          child: AnnotatedRegion(
              value: SystemUiOverlayStyle(
                statusBarColor: Color(0x9E9E9EFF),
                statusBarIconBrightness: Brightness.dark,
              ),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        onTap: () async {
                          final message = await AuthService().logout();
                          if (message!.contains('Success')) {
                            Navigator.pushNamed(context, Login.id);

                            showAlertBanner(
                                context,
                                    () {},
                                const AlertBanner(
                                  backgroundColor: Colors.green,
                                  message: "Logout Successful",// Pass the desired color here
                                ),
                                alertBannerLocation: AlertBannerLocation.top
                            );
                          } else {
                            showAlertBanner(
                                context,
                                    () => print(message),
                                AlertBanner(
                                  backgroundColor: Colors.redAccent,
                                  message: message,// Pass the desired color here
                                ),
                                alertBannerLocation: AlertBannerLocation.top
                            );
                          }
                        },
                        leading: const Icon(Icons.logout),
                        title: const Text('Logout')
                      ),
                    ),
                  ],
                ),
              )
          ),
        ),
      ][currentPageIndex],
    );
  }
}

import 'package:alert_banner/exports.dart';
import 'package:expense_tracker/Authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Common/alertBanner.dart';
import '../Authentication/authService.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<Home> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
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
        AnnotatedRegion(
            value: const SystemUiOverlayStyle(
            statusBarColor: Color(0x9E9E9EFF),
            statusBarIconBrightness: Brightness.dark,
          ),
            child: SafeArea(
              child: Scaffold(
                body: Card(
                  shadowColor: Colors.transparent,
                  margin: const EdgeInsets.all(8.0),
                  child: SizedBox.expand(
                    child: Center(
                      child: Text(
                        'Home page',
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ),
                ),
                  floatingActionButton: FloatingActionButton.extended(
                    backgroundColor: Colors.deepPurple,
                    onPressed: (){},
                    label: const Text('New'),
                    icon: const Icon(Icons.add, color: Colors.white, size: 25),
                  )
              ),
            ),
          ),


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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Login()),
                            );

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
                        leading: Icon(Icons.notifications_sharp),
                        title: Text('Logout'),
                        subtitle: Text('This is a notification'),
                      ),
                    ),
                    const Card(
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
      ][currentPageIndex],
    );
  }
}

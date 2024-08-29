import 'package:expense_tracker/Components/Dialog/newRecordDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AnnotatedRegion(
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
              onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => const NewRecordDialog(),
              ),
              label: const Text('New'),
              icon: const Icon(Icons.add, color: Colors.deepPurple, size: 25),
            )
        ),
      ),
    );
  }
}

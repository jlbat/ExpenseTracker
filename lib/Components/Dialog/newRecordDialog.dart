import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ExpenseTypes {
  fnb('FNB', 1),
  petrol('Petrol', 2),
  grocery('Grocery', 3),
  utility('Utility', 4),
  other('Other', 5);

  const ExpenseTypes(this.label, this.value);
  final String label;
  final int value;
}

class NewRecordDialog extends StatefulWidget {
  const NewRecordDialog({super.key});

  @override
  State<NewRecordDialog> createState() => _NewRecordDialogState();
}

class _NewRecordDialogState extends State<NewRecordDialog> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Add New Record',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.purple
        ),
      ),
      content: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
                child: Container(
                  alignment: FractionalOffset.centerLeft,
                  padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                  child: const Text(
                    'Description :',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),

                ),
                child: TextFormField(
                  controller: _descriptionController,
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                  cursorColor: const Color(0x9E9E9EFF),
                  decoration: const InputDecoration(
                      border: InputBorder.none
                  ),
                  inputFormatters: [ LengthLimitingTextInputFormatter(20)],
                ),
              ),
              SizedBox(
                height: 40,
                child: Container(
                  alignment: FractionalOffset.centerLeft,
                  padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                  child: const Text(
                    'Types :',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: DropdownMenu<ExpenseTypes>(
                  dropdownMenuEntries: ExpenseTypes.values
                      .map<DropdownMenuEntry<ExpenseTypes>>(
                          (ExpenseTypes type) {
                        return DropdownMenuEntry<ExpenseTypes>(
                            value: type,
                            label: type.label
                        );
                      }).toList(),
                  inputDecorationTheme: const InputDecorationTheme(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.deepPurple),
                      labelStyle: TextStyle(color: Colors.deepPurple)
                  ),
                  textStyle: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                  menuStyle: MenuStyle(
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(230, 230, 250, 0.9)),

                  ),
                  width: 280,
                ),
              ),
              SizedBox(
                height: 40,
                child: Container(
                  alignment: FractionalOffset.centerLeft,
                  padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                  child: const Text(
                    'Price :',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: TextFormField(
                  controller: _priceController,
                  cursorColor: const Color(0x9E9E9EFF),
                  inputFormatters: [ FilteringTextInputFormatter.allow(RegExp(r'^[+-]?(\d+)?(\.\d*)?$'))],
                  style: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                  decoration: const InputDecoration(
                      border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Container(
                  alignment: FractionalOffset.bottomLeft,
                  padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                  child: const Text(
                    'Remark :',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                      fontSize: 18
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),

                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 180,
                      child: TextFormField(
                        controller: _remarkController,
                        style: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                        cursorColor: const Color(0x9E9E9EFF),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.multiline,
                        expands: true,
                        maxLength: 200,
                        maxLines: null,
                        minLines: null,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('Add'),
        ),
      ],
    );
  }
}



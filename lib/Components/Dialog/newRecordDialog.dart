import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewRecordDialog extends StatefulWidget {
  const NewRecordDialog({super.key});

  @override
  State<NewRecordDialog> createState() => _NewRecordDialogState();
}

class _NewRecordDialogState extends State<NewRecordDialog> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Record'),
      content: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),

                ),
                child: TextFormField(
                  controller: _descriptionController,
                  style: const TextStyle(color: Colors.deepPurple),
                  cursorColor: const Color(0x9E9E9EFF),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Description : ',
                      labelStyle: TextStyle(color: Colors.deepPurple)
                  ),
                ),
              ),
              const SizedBox(height: 10,),
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
                  style: const TextStyle(color: Colors.deepPurple),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Price : ',
                      labelStyle: TextStyle(color: Colors.deepPurple)
                  ),
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



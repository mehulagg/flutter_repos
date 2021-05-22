import 'package:universal_platform/universal_platform.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widgets/adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text);

    if (enteredTitle.isEmpty ||
        enteredAmount == null ||
        enteredAmount <= 0 ||
        _selectedDate == null) {
      return;
    }

    widget.addNewTransaction(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    (UniversalPlatform.isLinux || UniversalPlatform.isWeb)
        ? showCupertinoModalPopup(
            context: context,
            builder: (context) => CupertinoActionSheet(
              actions: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (pickedDate) {
                      if (pickedDate == null) {
                        return;
                      }
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    },
                    minimumYear: 2020,
                    initialDateTime: DateTime.now(),
                    maximumDate: DateTime.now(),
                  ),
                ),
              ],
              cancelButton: CupertinoActionSheetAction(
                child: Text('Done'),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          )
        // CupertinoDatePicker(onDateTimeChanged:(pickedDate) {
        //   if (pickedDate == null) {
        //     return;
        //   }
        //   setState(() {
        //     _selectedDate = pickedDate;
        //   });
        // } ,initialDateTime: DateTime.now(),)
        : showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now(),
          ).then((pickedDate) {
            if (pickedDate == null) {
              return;
            }
            setState(() {
              _selectedDate = pickedDate;
            });
          });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _titleController.addListener(() {
  //     final String text = _titleController.text;
  //     _titleController.value = _titleController.value.copyWith(
  //       text: text,
  //       selection: TextSelection(
  //         baseOffset: text.length,
  //         extentOffset: text.length,
  //       ),
  //       composing: TextRange.empty,
  //     );
  //   });
  // }

  // @override
  // void dispose() {
  //   _titleController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'title',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                ),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date chosen'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    AdaptiveFlatButton('Choose Date', _presentDatePicker),
                  ],
                ),
              ),
              (UniversalPlatform.isLinux || UniversalPlatform.isWeb)
                  ? CupertinoButton.filled(
                      onPressed: _submitData,
                      child: Text(
                        'Add transaction',
                      ),
                    )
                  : ElevatedButton(
                      onPressed: _submitData,
                      child: Text(
                        'Add transaction',
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

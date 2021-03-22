import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
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
                    controller: titleController,
                    // onChanged: (value) {
                    //   titleInput = value;
                    // },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    // onChanged: (value) {
                    //   amoutInput = value;
                    // },
                  ),
                  TextButton(
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                    },
                    child: Text(
                      'Add transaction',
                    ),
                    style: TextButton.styleFrom(primary: Colors.purple),
                  )
                ],
              ),
            ),
          );
  }
}
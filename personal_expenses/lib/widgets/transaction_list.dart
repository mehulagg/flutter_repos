import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:rive/rive.dart';

import 'transaction_item.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList>
    with SingleTickerProviderStateMixin {
  void _togglePlay() {
    setState(() => _controller.isActive = !_controller.isActive);
  }

  bool get isPlaying => _controller?.isActive ?? false;

  Artboard _riveArtboard;
  RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/rive/zombie.riv').then(
      (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller = SimpleAnimation('Loading'));
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.transactions.isEmpty
        ? SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: _riveArtboard == null
                      ? const SizedBox()
                      : Rive(
                          artboard: _riveArtboard,
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _togglePlay,
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                )
              ],
            ),
          )
        : ListView(
            children: widget.transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: widget.deleteTx,
                    ))
                .toList(),
            // : ListView.builder(
            //     itemBuilder: (context, index) {
            //       return TransactionItem(
            //         key: ValueKey(widget.transactions[index].id),
            //         transaction: widget.transactions[index],
            //         deleteTx: widget.deleteTx,
            //       );
            //     },
            //     itemCount: widget.transactions.length,
          );
  }
}

import 'package:bid_brush/pages/broadcast_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class UserAuctionPage extends StatefulWidget {
  const UserAuctionPage({super.key, required this.totalBidAmount});
  final double totalBidAmount;
  @override
  _UserAuctionPageState createState() => _UserAuctionPageState();
}

class _UserAuctionPageState extends State<UserAuctionPage> {
  final _channelName = TextEditingController();
  String check = '';
  @override
  void initState() {
    super.initState();
    _channelName.text = 'bid'; // Set text programmatically to 'bid'
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Auction'),
        ),
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.2,
                child: TextFormField(
                  controller: _channelName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Channel Name',
                  ),
                ),
              ),
              TextButton(
                onPressed: () => onJoin(isBroadcaster: false),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Start Bid  ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                      Icons.gavel,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              Text(
                check,
                style: const TextStyle(color: Colors.red),
              )
            ],
          ),
        ));
  }

  Future<void> onJoin({required bool isBroadcaster}) async {
    await [Permission.camera, Permission.microphone].request();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BroadcastPage(
          channelName: _channelName.text,
          isBroadcaster: isBroadcaster, key: UniqueKey(),
        ),
      ),
    );
  }
}
import 'package:bid_brush/pages/broadcast_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';



class ArtistAuctionPage extends StatefulWidget {
  const ArtistAuctionPage({super.key});

  @override
  _ArtistAuctionPageState createState() => _ArtistAuctionPageState();
}

class _ArtistAuctionPageState extends State<ArtistAuctionPage> {
  final _channelName = TextEditingController();
  String check = '';

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
                style: TextButton.styleFrom(
                  foregroundColor: Colors.pink,
                ),
                onPressed: () => onJoin(isBroadcaster: true),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Go Live   ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Icon(
                        Icons.live_tv,
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
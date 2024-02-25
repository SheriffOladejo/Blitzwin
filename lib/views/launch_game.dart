import 'package:blitzwin/utilities/db_helper.dart';
import 'package:blitzwin/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/app_user.dart';
import '../utilities/hex_color.dart';

class LaunchGameScreen extends StatefulWidget {

  String url;
  LaunchGameScreen({this.url});

  @override
  State<LaunchGameScreen> createState() => _LaunchGameScreenState();

}

class _LaunchGameScreenState extends State<LaunchGameScreen> {

  final utils = Utils();

  AppUser user;
  WebViewController controller;

  DbHelper helper = DbHelper();

  Future<void> init () async {
    user = await helper.getUser();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    setState(() {

    });
  }

  @override
  void initState () {
    super.initState();
    init();
  }

  Future<void> callback () async {
    user = await helper.getUser();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: HexColor("#03070A"),
          leading: Column(
            children: [
              Container(
                  width: 80,
                  alignment: Alignment.center,
                  child: SvgPicture.asset("assets/images/appbar_logo.svg")
              ),
              const Text("BLITZWIN", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  fontFamily: 'lato-bold',
                  color: Colors.white
              ),),
            ],
          ),
          actions: user == null ? utils.loggedOutAppbar(context, callback) : utils.loggedInAppBar()
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(bottom: 70),
        color: HexColor("#03070A"),
        child: WebViewWidget(controller: controller),
      ),
    );
  }

}

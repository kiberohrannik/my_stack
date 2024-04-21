import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_stack/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const String overflowUrl = 'https://stackoverflow.com/';
const String exchangeUrl = 'https://stackexchange.com/';

class _MyHomePageState extends State<MyHomePage> {
  InAppWebViewController? webViewController;
/*  = InAppWebViewController.fromPlatform(
      platform: PlatformInAppWebViewController.static()
  );*/

  int _counter = 0;
  // bool _overflowSelected = false;
  // bool _exchangeSelected = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onStackOverflowTapped() async {
    // setState(() {
    //   _overflowSelected = !_overflowSelected;
    //   _exchangeSelected = false;
    // });

    webViewController?.loadUrl(
        urlRequest:
        // URLRequest(url: await webViewController?.getUrl()));
        URLRequest(url: WebUri.uri(Uri.parse(overflowUrl)))
    );

    // var uri = Uri.parse(overflowUrl);
    // if(!await launchUrl(uri)) {
    //   throw Exception("Can't open url in browser!");
    // }
  }

  void _onStackExchangeTapped() async {
    // setState(() {
    //   _exchangeSelected = !_exchangeSelected;
    //   _overflowSelected = false;
    // });

    var uri = Uri.parse(exchangeUrl);
    if(!await launchUrl(uri)) {
    throw Exception("Can't open url in browser!");
    }
  }

  @override
  Widget build(BuildContext context) {
    Color backColor = Theme.of(context).colorScheme.inversePrimary;

    return Scaffold(
      body: Expanded(
        child: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri("https://inappwebview.dev/")),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        backgroundColor: AppColor.backWhite,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: AppColor.accentYellowDark), //Color(0xffecc148)
                child: Text(
              'To explore',
              textAlign: TextAlign.center,
            )),
            ListTile(
              splashColor: AppColor.accentOrange,
              title: Text('StackOverflow'),
              // selectedTileColor: FlowColor.backYellow,
              onTap: () => _onStackOverflowTapped(),
            ),

            ListTile(
              title: Text('StackExchange'),
                splashColor: AppColor.backBlue,
                onTap: () => _onStackExchangeTapped()
            ),

            ListTile(
              title: Text('Timer'),
              leading: Icon(Icons.timer),
              selectedTileColor: AppColor.backYellow,
              selected: false,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

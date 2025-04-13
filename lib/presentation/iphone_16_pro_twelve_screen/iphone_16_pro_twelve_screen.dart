import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_driver/presentation/iphone_16_pro_twelve_screen/controller/iphone_16_pro_twelve_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

class Iphone16ProTwelveScreen extends StatefulWidget {
  @override
  State<Iphone16ProTwelveScreen> createState() => _Iphone16ProTwelveScreenState();
}

class _Iphone16ProTwelveScreenState extends State<Iphone16ProTwelveScreen> {
  final controller = Get.find<Iphone16ProTwelveController>();
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'pickupPoints',
        onMessageReceived: (JavaScriptMessage message) {
          final addresses = List<String>.from(json.decode(message.message));
          controller.setPickupPoints(addresses);
        },
      )
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (_) {},
      ));
    _loadHtml();
  }

  Future<void> _loadHtml() async {
    final html = await rootBundle.loadString('assets/map_driver.html');
    final uri = Uri.dataFromString(html, mimeType: 'text/html', encoding: Encoding.getByName('utf-8'));
    webViewController.loadRequest(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Driver Map")),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: WebViewWidget(controller: webViewController),
          ),
          Expanded(
            flex: 2,
            child: Obx(() => ListView.builder(
              itemCount: controller.pickupPoints.length,
              itemBuilder: (_, index) {
                return ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(controller.pickupPoints[index].address),
                );
              },
            )),
          )
        ],
      ),
    );
  }
}

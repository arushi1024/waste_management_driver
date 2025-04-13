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
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            // Extract pickup points from HTML when the page is loaded
            _extractPickupPointsFromMap();
          },
        ),
      );
    _loadHtml();
  }

  Future<void> _loadHtml() async {
    final html = await rootBundle.loadString('assets/map_driver.html');
    final uri = Uri.dataFromString(html, mimeType: 'text/html', encoding: Encoding.getByName('utf-8'));
    webViewController.loadRequest(uri);
  }

  // Function to extract pickup points from the HTML map
  void _extractPickupPointsFromMap() {
    final jsCode = """
      if (typeof pickupPoints !== 'undefined') {
        const addresses = pickupPoints.map(point => point.address);
        window.pickupPoints.postMessage(JSON.stringify(addresses));
      }
    """;
    
    webViewController.runJavaScript(jsCode);
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
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text("${index + 1}"),
                  ),
                  title: Text(controller.pickupPoints[index].address),
                  trailing: IconButton(
                    icon: Icon(Icons.directions),
                    onPressed: () {
                      // When a list item is clicked, navigate to this point on the map
                      if (controller.pickupPoints.length > index) {
                        _navigateToPickupPoint(index);
                      }
                    },
                  ),
                );
              },
            )),
          )
        ],
      ),
    );
  }
  
  // Function to navigate to a specific pickup point when clicked in the list
  void _navigateToPickupPoint(int index) {
    webViewController.runJavaScript("""
      if (typeof map !== 'undefined' && typeof pickupPoints !== 'undefined') {
        // Get the coordinates of the selected pickup point
        const point = pickupPoints[$index];
        if (point) {
          // Center the map on the selected point
          map.flyTo({
            center: point.coords,
            zoom: 15,
            essential: true
          });
          
          // Open the popup for this marker
          const markers = document.querySelectorAll('.custom-marker');
          if (markers.length > $index) {
            // Simulate a click on the marker
            const clickEvent = new MouseEvent('click', {
              view: window,
              bubbles: true,
              cancelable: true
            });
            markers[$index].dispatchEvent(clickEvent);
          }
        }
      }
    """);
  }
}
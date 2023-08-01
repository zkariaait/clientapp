import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_collapsing_toolbar/flutter_collapsing_toolbar.dart';
import 'package:tap_to_expand/tap_to_expand.dart';

import '../scanner/screens/qr_scanner_screen .dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

const kSampleIcons = [
  Icons.receipt_long_outlined,
  Icons.wifi_protected_setup_outlined,
  Icons.add_to_home_screen_outlined,
  Icons.qr_code_scanner_sharp,
];
const kSampleIconLabels = [
  'History',
  'Refresh',
  ' ',
  'Scan',
];

class _HomeState extends State<Home> {
  final controller = ScrollController();
  double headerOffset = 0.0;
  @override
  void initState() {
    controller.addListener(() {
      print('_MyAppState.initState.controller.offset: ${controller.offset}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    print('_HomeState.build.topPadding: $topPadding');
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: topPadding),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CollapsingToolbar(
                controller: controller,
                expandedHeight: 160,
                collapsedHeight: 64,
                decorationForegroundColor: Color.fromARGB(255, 53, 138, 234),
                decorationBackgroundColor: Colors.white,
                onCollapsing: (double offset) {
                  setState(() {
                    headerOffset = offset;
                  });
                },
                leading: Container(
                  margin: EdgeInsets.only(left: 12),
                  padding: EdgeInsets.all(4),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 24,
                    color: Colors.black38,
                  ),
                ),
                title: Text(
                  'Hi Name',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(CircleBorder()),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.all(0.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'solde:\n \$500',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
                featureCount: kSampleIcons.length,
                featureIconBuilder: (context, index) {
                  return Icon(
                    kSampleIcons[index],
                    size: 54,
                    color: Colors.white,
                  );
                },
                featureLabelBuilder: (context, index) {
                  return Text(
                    kSampleIconLabels[index],
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  );
                },
                featureOnPressed: (context, index) async {
                  try {
                    ScanResult scanResult = await BarcodeScanner.scan();
                    String qrCode = '';
                    qrCode = scanResult.rawContent;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            QRCodeScreen(qrCodeContent: qrCode),
                      ),
                    );
                  } on PlatformException catch (e) {
                    if (e.code == BarcodeScanner.cameraAccessDenied) {
                      // Handle camera permission denied
                      print('Camera permission denied');
                    } else {
                      // Handle other errors
                      print('Error: ${e.message}');
                    }
                  } on FormatException {
                    // Handle user pressing back button without scanning any QR code
                    print('User pressed back button');
                  } catch (e) {
                    // Handle other exceptions
                    print('Error: ${e.toString()}');
                  }
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  controller: controller,
                  child: Column(
                    children: [
                      Container(
                        height:
                            headerOffset + MediaQuery.of(context).padding.top,
                      ),
                      // Container(
                      //   height: 350,
                      //   color: Colors.white,
                      // ),
                      //Image.asset('assets/Group 1.png'),
                      const SizedBox(height: 50),
                      TapToExpand(
                        color: const Color.fromARGB(255, 53, 138, 234),
                        content: Column(
                          children: <Widget>[
                            for (var i = 1; i <= 20; i++)
                              Text(
                                "product $i",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                          ],
                        ),
                        title: Text(
                          'Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onTapPadding: 10,
                        closedHeight: 90,
                        scrollable: true,
                        borderRadius: 10,
                        openedHeight: 200,
                      ),
                      const SizedBox(height: 550),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

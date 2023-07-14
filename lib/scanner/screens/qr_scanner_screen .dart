import 'package:client_app/models/order.dart';
import 'package:client_app/thankyou/thanku_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QRCodeScreen extends StatelessWidget {
  final String qrCodeContent;

  const QRCodeScreen({Key? key, required this.qrCodeContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Order order = Order.fromJson(qrCodeContent);
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    print(qrCodeContent);
    print('√${order.lastName}');
// √
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Receipt',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${order.firstName} ${order.lastName}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const SizedBox(height: 5),
                              const Text('tel: (212) 5 86 82 96 55'),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '$formatted',
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Receipt #: 34522677W',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                    Table(
                      border: TableBorder.all(
                        color: Colors.white,
                      ),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          children: const [
                            TableCell(
                              child: Text(
                                'Product',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TableCell(
                              child: Text(
                                'Quantity',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TableCell(
                              child: Text(
                                'Price',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TableCell(
                              child: Text(
                                'Total',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        for (var item in order.productItems)
                          TableRow(
                            children: [
                              TableCell(
                                child: Text(
                                  item.product.title,
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              TableCell(
                                child: Text(
                                  item.quantity.toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              TableCell(
                                child: Text(
                                  '\$${item.product.price.toStringAsFixed(2)}',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              TableCell(
                                child: Text(
                                  '\$${(item.product.price * item.quantity).toStringAsFixed(2)}',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        TableRow(
                          children: [
                            const TableCell(child: SizedBox()),
                            const TableCell(child: SizedBox()),
                            const TableCell(
                              child: Text(
                                'Total:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            TableCell(
                              child: Text(
                                '\$${order.total.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 150),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ThankYouPage(title: 'Thank You'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Pay Now',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.payment_sharp),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

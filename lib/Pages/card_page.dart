import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/card_model.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: Consumer<CardModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Card",
                  style: TextStyle(
                    fontFamily: 'NotoSerif',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: value.cardItem.length,
                      padding: const EdgeInsets.all(12),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              leading: Image.asset(
                                value.cardItem[index][2],
                                height: 36,
                              ),
                              title: Text(value.cardItem[index][0]),
                              subtitle: Text('\$ ' + value.cardItem[index][1]),
                              trailing: IconButton(
                                onPressed: () => Provider.of<CardModel>(context,
                                        listen: false)
                                    .removeItemFromCard(index),
                                icon: const Icon(Icons.cancel),
                              ),
                            ),
                          ),
                        );
                      })),
              Padding(
                padding: const EdgeInsets.all(36),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                                color: Colors.green.shade100, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            '\$${value.calculateTotal()}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(12),
                        child: const Row(
                          children: [
                            Text(
                              'Pay Now',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

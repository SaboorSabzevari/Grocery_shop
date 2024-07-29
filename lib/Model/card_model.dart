import 'package:flutter/material.dart';

class CardModel extends ChangeNotifier {
  final List _shopItem = [
    ['Avocado', '4.0', 'images/avocado.png', Colors.green],
    ['Banana', '2.50', 'images/banana.png', Colors.yellow],
    ['Chicken', '12.80', 'images/chicken.png', Colors.brown],
    ['Water', '1.0', 'images/water.png', Colors.blue],
  ];
  get shopItem => _shopItem;

  final List _cardItem = [];
  get cardItem => _cardItem;

  //adding items to card
  void addItemToCard(int index) {
    _cardItem.add(_shopItem[index]);
    notifyListeners();
  }

//removing items for the card

  void removeItemFromCard(int index) {
    _cardItem.remove(_shopItem[index]);
    notifyListeners();
  }

//calculate the total price

  String calculateTotal() {
    double total = 0;
    for (int i = 0; i < _cardItem.length; i++) {
      total += double.parse(_cardItem[i][1]);
    }
    return total.toStringAsFixed(2);
  }
}

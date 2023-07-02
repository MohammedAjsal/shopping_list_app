import 'package:flutter/material.dart';

import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItem = [];
  void _addItem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItem.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("No items in the list"),
    );
    if (_groceryItem.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItem.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(_groceryItem[index].name),
          leading: Container(
            width: 24,
            height: 24,
            color: _groceryItem[index].category.color,
          ),
          trailing: Text(
            _groceryItem[index].quantity.toString(),
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Your Groceries"),
            actions: [
              IconButton(
                onPressed: _addItem,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: content),
    );
  }
}

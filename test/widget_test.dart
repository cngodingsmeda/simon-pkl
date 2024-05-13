import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const ListPKLApp());
}

class ListPKLApp extends StatelessWidget {
  const ListPKLApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ExpansionPanelList Sample')),
        body: const ListPKL(),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
      isExpanded: false,
    );
  });
}

class ListPKL extends StatelessWidget {
  const ListPKL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Item> data = generateItems(8);

    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(data),
      ),
    );
  }

  Widget _buildPanel(List<Item> data) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        data[index].isExpanded = !isExpanded;
      },
      children: data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            subtitle:
                const Text('To delete this panel, tap the trash can icon'),
            trailing: const Icon(Icons.delete),
            onTap: () {
              data.removeWhere((Item currentItem) => item == currentItem);
            },
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final String text;
  final Function() onEdit;
  final Function() onRemove;

  ItemList({
    Key? key,
    required this.text,
    required this.onEdit,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF2D2D2D),
      child: ListTile(
        onTap: onEdit,
        title: Row(
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              child: Container(),
            ),
            Tooltip(
              message: 'Remover',
              textStyle: TextStyle(color: Colors.white),
              child: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: onRemove,
                color: Color(0xffFF4181),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

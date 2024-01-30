import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing List 193156',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClothingListScreen(),
    );
  }
}

class ClothingListScreen extends StatefulWidget {
  @override
  _ClothingListScreenState createState() => _ClothingListScreenState();
}

class _ClothingListScreenState extends State<ClothingListScreen> {
  List<String> clothingItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothing List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _showAddClothingDialog();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green.shade300,
              ),
              child: Text(
                'Add clothing',
                style: TextStyle(color: Colors.red.shade400),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: clothingItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    clothingItems[index],
                    style: TextStyle(color: Colors.blue.shade800),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.green),
                        onPressed: () {
                          _showEditClothingDialog(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _showDeleteClothingDialog(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddClothingDialog() {
    String newClothing = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add clothing'),
          content: TextField(
            onChanged: (value) {
              newClothing = value;
            },
            decoration: InputDecoration(labelText: 'Clothing name:'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  clothingItems.add(newClothing);
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text(
                'Add',
                style: TextStyle(color: Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showEditClothingDialog(int index) {
    String editedClothing = clothingItems[index];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit clothing'),
          content: TextField(
            onChanged: (value) {
              editedClothing = value;
            },
            decoration: InputDecoration(labelText: 'New clothing:'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  clothingItems[index] = editedClothing;
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text(
                'Save',
                style: TextStyle(color: Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteClothingDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Clothing'),
          content: Text('Are you sure you want to delete this clothing?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  clothingItems.removeAt(index);
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}

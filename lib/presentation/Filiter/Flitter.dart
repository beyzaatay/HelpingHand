import 'package:flutter/material.dart';
import 'package:helpinghand/service/database/database_service.dart';

class CategorySelection extends StatefulWidget {
  const CategorySelection({Key? key}) : super(key: key);

  @override
  _CategorySelectionState createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  List<String> categories = [];
  List<String> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  Future<void> getCategories() async {
    List<String> fetchedCategories = await DatabaseService().getCategories();
    setState(() {
      categories = fetchedCategories;
    });
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case "food":
        return Colors.blue;
      case "dress":
        return Colors.green;
      case "medicine":
        return Colors.red;
      case "shoe":
        return Colors.orange;
      case "hygiene_products":
        return Colors.purple;
      case "blanket":
        return Colors.yellow;
      case "diaper":
        return Colors.teal;
      case "coat":
        return Colors.indigo;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop == false) {
          Navigator.of(context).pop(selectedCategories);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF304674),
          title: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Filters',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 110, 10),
                child: Image.asset(
                  'assets/images/imageLogoVektor.png', // Logo dosyanızın yolunu belirtin
                  fit: BoxFit.contain,
                  height: 52,
                  width: 120,
                ),
              ),
            ],
          ),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (selectedCategories.contains(categories[index])) {
                    selectedCategories.remove(categories[index]);
                  } else {
                    selectedCategories.add(categories[index]);
                  }
                });
              },
              child: Card(
                elevation: 6,
                color: selectedCategories.contains(categories[index])
                    ? _getCategoryColor(categories[index]).withOpacity(0.9)
                    : _getCategoryColor(categories[index]),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight:
                            selectedCategories.contains(categories[index])
                                ? FontWeight.bold
                                : FontWeight.normal,
                        color: selectedCategories.contains(categories[index])
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

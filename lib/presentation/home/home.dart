import 'package:flutter/material.dart';

import 'package:helpinghand/model/ad.dart';
import 'package:helpinghand/notifiers/tab_notifier.dart';
import 'package:helpinghand/presentation/main_giris_one_screen/main_giris_one_screen.dart';

import '../Filiter/Flitter.dart';

class Home extends StatefulWidget {
  final List<Ad> ads;
  const Home(this.ads, {Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchKey = "";
  late final List<Ad> totalAds;
  Set<Ad> currentAds = {};
  bool isLoading = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        isLoading = true;
      });
      totalAds = widget.ads;

      currentAds.addAll(totalAds);
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filteredAds = searchKey.isEmpty
        ? currentAds
        : currentAds
            .where((element) => element.title?.contains(searchKey) ?? false)
            .toList();

/*     final filteredCategoryAds = "seçili kategori".isEmpty
        ? filteredAds
        : filteredAds
            .where((element) => element."cateoory"?.contains("seçili kategori") ?? false)
            .toList(); */

    return ValueListenableBuilder<Ad?>(
      valueListenable: adNotifier.currentAd,
      builder: (context, currentAd, _) {
        return Scaffold(
          backgroundColor: Color(304674),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        // LOGO
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/imageLogoVektor.png', // Logo dosyasının yolunu buraya ekleyin
                              width: 100, // İstenen genişlik değeri
                              height: 100, // İstenen yükseklik değeri
                              fit: BoxFit.contain, // Resmi boyutlandırma türü
                            ),
                          ],
                        ),
                        searchBox(),
                        Expanded(
                          child: ListView.builder(
                            itemCount: filteredAds.length,
                            itemBuilder: ((context, index) {
                              final ad = filteredAds.toList()[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Container(
                                  height: 100,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Card(
                                    elevation:
                                        2, // Card'a gölge efekti ekliyoruz
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        if (ad.location != null) {
                                          adNotifier.currentAd.value = ad;
                                          tabNotifier.switchTab(1);
                                        }
                                      },
                                      leading: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: CircleAvatar(
                                          radius:
                                              20, // CircleAvatar'ın yarıçapını ayarla
                                          backgroundColor: Colors.transparent,
                                          child: ClipOval(
                                            child: ad.image != null &&
                                                    ad.image != ""
                                                ? Image.network(
                                                    ad.image!,
                                                    fit: BoxFit.cover,
                                                    width:
                                                        40, // Resmin genişliğini ayarla
                                                    height:
                                                        40, // Resmin yüksekliğini ayarla
                                                  )
                                                : Icon(
                                                    Icons.image,
                                                    color: Colors.grey
                                                      ..shade200,
                                                  ),
                                          ),
                                        ),
                                      ),
                                      title: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          ad.title ?? "-",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      subtitle: ad.categories != null
                                          ? Row(
                                              children: [
                                                for (final category
                                                    in ad.categories!)
                                                  if (category != null)
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 5),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1,
                                                              horizontal: 3),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            _getCategoryColor(
                                                          category,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                      ),
                                                      child: Text(
                                                        category,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    )
                                              ],
                                            )
                                          : SizedBox.shrink(),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
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

  Widget searchBox() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 24.0, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            suffixIcon: Padding(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategorySelection(),
                    ),
                  ).then(
                    (selectedCategories) {
                      if (selectedCategories is List<String> &&
                          selectedCategories.isNotEmpty) {
                        currentAds.addAll(totalAds);
                        final toRemove = [];
                        for (final currentAd in currentAds) {
                          bool isCategoryMatched = false;
                          for (final selectedCategory in selectedCategories) {
                            if (currentAd.categories!
                                .contains(selectedCategory)) {
                              isCategoryMatched = true;
                            }
                          }
                          if (!isCategoryMatched) toRemove.add(currentAd);
                        }
                        currentAds.removeWhere((e) => toRemove.contains(e));
                        setState(() {});
                      } else {
                        // If no category is selected, show all ads
                        totalAds.forEach((element) {
                          print(element.title);
                        });
                        setState(() {
                          currentAds.addAll(totalAds);
                        });
                      }
                    },
                  );
                },
                child: Image.asset(
                  'assets/images/filtre.png',
                  width: 10,
                  height: 10,
                ),
              ),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(16),
          ),
          onChanged: (value) {
            setState(() {
              searchKey = value;
            });
          },
        ),
      ),
    );
  }
}

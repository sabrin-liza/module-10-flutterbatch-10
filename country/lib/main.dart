import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Countrycard(),
  ));
}

class Countrycard extends StatelessWidget {
  final List<Map<String, String>> country = [
    { 'title': 'Bangladesh',
      'code': '+880',
      'continent': 'Asia',
      'image': 'myassets/images/bangladesh.png'
    },
    { 'title': 'United States',
      'code': '+1',
      'continent': 'North America',
      'image': 'myassets/images/us.png'
    },
    { 'title': 'Japan',
      'code': '+81',
      'continent': 'Asia',
      'image': 'myassets/images/japan.png'
    },
    { 'title': 'Russia',
      'code': '+7',
      'continent': 'Europe/Asia',
      'image': 'myassets/images/russia.png'
    },
    { 'title': 'Germany',
      'code': '+49',
      'continent': 'Europe',
      'image': 'myassets/images/germany.png'
    },
    { 'title': 'France',
      'code': '+33',
      'continent': 'Europe',
      'image': 'myassets/images/france.png'
    },
    { 'title': 'Canada',
      'code': '+1',
      'continent': 'North America',
      'image': 'myassets/images/canada.png'
    },
    { 'title': 'Brazil',
      'code': '+55',
      'continent': 'South America',
      'image': 'myassets/images/brazil.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 2;
          if (constraints.maxWidth > 1024) {
            crossAxisCount = 4;
          } else if (constraints.maxWidth > 768) {
            crossAxisCount = 3;
          }

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: country.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final item = country[index];
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          item['image']!,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _badge(Icons.phone, item['code']!),
                                SizedBox(width: 6),
                                _badge(Icons.public, item['continent']!),
                              ],
                            ),
                            SizedBox(height: 8),
                            Center(
                              child: Text(
                                item['title']!,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Details"),
                                  Icon(Icons.arrow_forward),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 36),
                                backgroundColor: const Color.fromARGB(255, 156, 161, 170),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _badge(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 239, 222, 222),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: const Color.fromARGB(255, 72, 71, 71)),
          SizedBox(width: 3),
          Text(text, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

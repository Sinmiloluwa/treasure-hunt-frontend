import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final treasureHunts = [
      {
        "title": "Campus Hunt",
        "clues": 5,
        "image": "https://picsum.photos/id/1015/400/300"
      },
      {
        "title": "City Adventure",
        "clues": 8,
        "image": "https://picsum.photos/id/1011/400/300"
      },
      {
        "title": "Mall Mystery",
        "clues": 3,
        "image": "https://picsum.photos/id/1012/400/300"
      },
      {
        "title": "Beach Quest",
        "clues": 6,
        "image": "https://picsum.photos/id/1013/400/300"
      },
      {
        "title": "Mountain Hunt",
        "clues": 4,
        "image": "https://picsum.photos/id/1016/400/300"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ongoing hunts header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                'Ongoing Hunts',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),

            // Ongoing hunts grid
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: treasureHunts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final hunt = treasureHunts[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      // TODO: Navigate to hunt details
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(hunt["image"] as String),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.map,
                                size: 40, color: Colors.tealAccent),
                            const SizedBox(height: 10),
                            Text(
                              hunt["title"] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${hunt["clues"]} clues",
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Upcoming hunts header right after grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                'Upcoming Hunts',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),

            // TODO: Add your upcoming hunts list/grid here
            const SizedBox(height: 200, child: Center(child: Text("Coming soon..."))),
          ],
        ),
      ),
    );
  }
}

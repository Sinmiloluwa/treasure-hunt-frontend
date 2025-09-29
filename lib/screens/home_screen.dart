import 'package:flutter/material.dart';
import 'package:treasure_hunt/services/auth_service.dart';
import 'package:treasure_hunt/services/hunt_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _getOngoingHunts();
  }

  Future<void> _getOngoingHunts() async {
    try {
      final huntService = HuntService();
      final response = await huntService.getHunts();
      final hunts = response;
      print('Fetched hunts: $hunts'); // Parse the response to get hunts
    } catch (e) {
      print(e);
    }
  }

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
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            hunt["image"] as String,
                            fit: BoxFit.cover,
                            color: Colors.black.withOpacity(0.4),
                            colorBlendMode: BlendMode.darken,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.broken_image,
                                  size: 48, color: Colors.grey),
                            ),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: Colors.grey[200],
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              );
                            },
                          ),
                          Padding(
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
                        ],
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
            const SizedBox(
                height: 200, child: Center(child: Text("Coming soon..."))),
          ],
        ),
      ),
    );
  }
}

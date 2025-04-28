import 'package:flutter/material.dart';
import 'plant_details.dart';

class PlantResultPage extends StatelessWidget {
  final Map<String, dynamic> plantData;
  final String imageUrl;

  const PlantResultPage({super.key, required this.plantData, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background gradient with smooth transition
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Plant Identification', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF16666B),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              // You can implement additional info functionality here
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E8F80), Color(0xFF16666B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4DB6AC), Color(0xFF1E8F80)],
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Plant Image with rounded corners and shadow effect
            Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.broken_image, size: 100, color: Colors.red),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Text for plant data with Card styling for better readability
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Plant Name with icon
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.white,
                      elevation: 5,
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.local_florist, color: Color(0xFF16666B), size: 30),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Predicted Plant: ${plantData["name"]}',
                                style: const TextStyle(
                                  color: Color(0xFF16666B),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                                maxLines: 2, // Limiting it to 2 lines, can increase or remove based on need
                                overflow: TextOverflow.ellipsis,  // Use ellipsis for text overflow
                                softWrap: true, // Allows text to wrap to the next line
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                    // Description with icon
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.white,
                      elevation: 5,
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.description, color: Color(0xFF16666B), size: 30),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Description: ${plantData["description"]}',
                                style: const TextStyle(
                                  color: Color(0xFF16666B),
                                  fontSize: 18,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Location with icon
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.white,
                      elevation: 5,
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on, color: Color(0xFF16666B), size: 30),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Found In: ${plantData["locations_in_india"]}',
                                style: const TextStyle(
                                  color: Color(0xFF16666B),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Button with enhanced styling: gradient background
            Center(
              child: SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF16666B),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 6,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlantDetailsPage(plantData: plantData),
                      ),
                    );
                  },
                  child: const Text(
                    'View More Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

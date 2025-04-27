import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'LuxStays',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/75.jpg',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Search bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  color: Colors.black12,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search luxury stays...',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Categories
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 38,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryChip('Featured', selected: true),
                _buildCategoryChip('Beachfront'),
                _buildCategoryChip('Luxury'),
                _buildCategoryChip('Family'),
                _buildCategoryChip('Romantic'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Hotels Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.75,
              children: [
                _buildHotelCard(
                  image:
                  'https://www.overwaterbungalows.net/wp-content/uploads/2019/10/ozen-bolifushi.jpg',
                  title: 'Ozen Reserve Bolifushi',
                  location: 'Maldives',
                  price: '\$2,800',
                  rating: 4.9,
                ),
                _buildHotelCard(
                  image:
                  'https://cf.bstatic.com/xdata/images/hotel/max1280x900/184396534.jpg',
                  title: 'Ikos Dassia',
                  location: 'Corfu, Greece',
                  price: '\$1,200',
                  rating: 4.8,
                ),
                _buildHotelCard(
                  image:
                  'https://www.riu.com/en/binary/riu/BBQ1-86_A_Bar.jpg',
                  title: 'Riu Palace Riviera',
                  location: 'Mexico',
                  price: '\$950',
                  rating: 4.7,
                ),
                _buildHotelCard(
                  image:
                  'https://cf.bstatic.com/xdata/images/hotel/max1024x768/328694793.jpg',
                  title: 'Taj Lake Palace',
                  location: 'Udaipur, India',
                  price: '\$1,500',
                  rating: 4.9,
                ),
                _buildHotelCard(
                  image:
                  'https://cf.bstatic.com/xdata/images/hotel/max1024x768/328694793.jpg',
                  title: 'Taj Lake Palace',
                  location: 'Udaipur, India',
                  price: '\$1,500',
                  rating: 4.9,
                ),
                _buildHotelCard(
                  image:
                  'https://cf.bstatic.com/xdata/images/hotel/max1024x768/328694793.jpg',
                  title: 'Taj Lake Palace',
                  location: 'Udaipur, India',
                  price: '\$1,500',
                  rating: 4.9,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool selected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.deepPurple : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? Colors.deepPurple : Colors.grey.shade300,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildHotelCard({
    required String image,
    required String title,
    required String location,
    required String price,
    required double rating,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(blurRadius: 4, color: Colors.black12, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel image with heart icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
                // child: Image
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.red),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(location, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.orange),
                        Text(rating.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../widgets/global_button.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.onProfile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 210,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: Container(
                  height: 130,
                  width: 109,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/splash1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
          _buildProfileInfo(),
          _buildCategoryButtons(),
          _buildRecipeCards(),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Column(
        children: [
          Text(
            'Amelia Melanes',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'San Francisco, CA',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatistic('23', 'Recipes'),
              _buildStatistic('431', 'Following'),
              _buildStatistic('1.4k', 'Followers'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatistic(String count, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GlobalButton(
              label: 'Food Recipes',
              icon: Icons.fastfood,
              onPressed: () {},
              isSelected: true,
            ),
            GlobalButton(
              label: 'CookBook',
              icon: Icons.book,
              onPressed: () {},
              isSelected: true,
            ),
            GlobalButton(
              label: 'Live_TV',
              icon: Icons.live_tv,
              onPressed: () {},
              isSelected: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeCards() {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        children: [
          _buildRecipeCard('Delicious Cake', '23 Recipes'),
          _buildRecipeCard('Chicken Spirit', '12 Recipes'),
        ],
      ),
    );
  }

  Widget _buildRecipeCard(String title, String subtitle) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  'https://via.placeholder.com/200',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

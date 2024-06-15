import 'package:flutter/material.dart';
import 'package:utechseel/models/utensil.dart';

class Slick extends StatelessWidget {
  final Utensil utensil;
  const Slick({
    required this.utensil,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15),
            ),
            child: Image.network(
              utensil.imageUrl?.first ??
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9cSGzVkaZvJD5722MU5A-JJt_T5JMZzotcw&s',
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(
              utensil.name ?? 'Unnamed Utensil',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              utensil.description ?? 'No description available',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

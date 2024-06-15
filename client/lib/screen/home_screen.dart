import 'package:flutter/material.dart';
import 'package:utechseel/api/utensils_api.dart';
import 'package:utechseel/models/utensil.dart';
import 'package:utechseel/widgets/slick.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  final UtensilsController _controller = UtensilsController();
  final List<Utensil> _utensils = [];
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true; // Changed from false to true

  @override
  void initState() {
    super.initState();
    _fetchUtensils();
  }

  Future<void> _fetchUtensils() async {
    if (_isLoading || !_hasMore) return;
    setState(() => _isLoading = true);

    try {
      final List<Utensil> fetchedUtensils =
          await _controller.fetchAll(page: _page);
      if (fetchedUtensils.isEmpty) {
        setState(() => _hasMore = false);
      } else {
        setState(() {
          _page++;
          _utensils.addAll(fetchedUtensils);
        });
      }
    } catch (e) {
      print('Error fetching utensils: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            !_isLoading &&
            _hasMore) {
          _fetchUtensils();
        }
        return false;
      },
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        itemCount: _utensils.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _utensils.length) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Slick(utensil: _utensils[index]),
          );
        },
      ),
    );
  }
}

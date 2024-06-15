import 'package:flutter/material.dart';
import 'package:utechseel/api/utensils_api.dart';
import 'package:utechseel/models/utensil.dart';
import 'package:utechseel/widgets/slick.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UtensilsController _controller = UtensilsController();
  final List<Utensil> _utensils = [];
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;

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
    return Scaffold(
      appBar: AppBar(
          title: const Text('Utensils Showcase'),
          backgroundColor: Colors.green,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
              !_isLoading &&
              _hasMore) {
            _fetchUtensils();
          }
          return false;
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _utensils.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _utensils.length) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Slick(utensil: _utensils[index]),
            );
          },
        ),
      ),
    );
  }
}

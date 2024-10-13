import 'package:antrian_app/core/constants/colors.dart';
import 'package:antrian_app/data/datasources/antrian_local_datasource.dart';
import 'package:antrian_app/data/models/antrian.dart';
import 'package:antrian_app/pages/antrian_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   List<Antrian> listAntrian = [];

  Future<void> getAntrian() async {
    final result = await AntrianLocalDatasource.instance.getAllAntrian();
    setState(() {
      listAntrian = result;
    });
  }

  @override
  void initState() {
    getAntrian();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home Page',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: listAntrian.isEmpty
      ? const Center(
        child: Text('Tidak ada antrian'),
      )
      : GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: listAntrian.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: AppColors.card,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  listAntrian[index].nama,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  listAntrian[index].noAntrian,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AntrianPage();
          }));
          getAntrian();
        },
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
    );
  }
}

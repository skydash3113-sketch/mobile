import 'package:flutter/material.dart';
import 'package:modul_10/viewmodel/fetchgame.dart';
import 'package:modul_10/model/detailgame.dart';

class Detail extends StatelessWidget {
  final int gameTerpilih;
  const Detail({super.key, required this.gameTerpilih});


  Future<DetailGame> fetchData() async {
    final jsonData = await fetchDataFromAPI(gameTerpilih);
    return DetailGame.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.amberAccent.shade400,
      body: FutureBuilder<DetailGame>(
        future: fetchData(),
        builder: (context, snapshot) {
          // Loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }


          else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Terjadi Kesalahan:\n${snapshot.error}',
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          }

          // Data kosong
          else if (!snapshot.hasData) {
            return const Center(
              child: Text('Data tidak tersedia'),
            );
          }


          final game = snapshot.data!;
          return Column(
            children: [
              // HEADER GAMBAR
              SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      child: Image.network(
                        game.thumbnail ?? '',
                        fit: BoxFit.cover,
                        height: 300,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 300,
                            color: Colors.grey.shade300,
                            child: const Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 100,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Tombol BACK
                    Positioned(
                      top: 40,
                      left: 15,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Expanded(
                child: Container(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // JUDUL GAME
                        Text(
                          game.title ?? 'Tanpa Judul',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),


                        Text(
                          '${game.genre ?? '-'} | ${game.platform ?? '-'}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        const Divider(thickness: 1, height: 25),

                        // MINIMUM REQUIREMENTS
                        const Text(
                          'Minimum System Requirements',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),

                        _requirementRow(
                          'OS',
                          game.minimum_system_requirements?.os ?? '-',
                        ),
                        _requirementRow(
                          'Processor',
                          game.minimum_system_requirements?.processor ?? '-',
                        ),
                        _requirementRow(
                          'Memory',
                          game.minimum_system_requirements?.memory ?? '-',
                        ),
                        _requirementRow(
                          'Graphics',
                          game.minimum_system_requirements?.graphics ?? '-',
                        ),
                        _requirementRow(
                          'Storage',
                          game.minimum_system_requirements?.storage ?? '-',
                        ),

                        const Divider(thickness: 1, height: 25),


                        const Text(
                          'Deskripsi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          game.description ?? 'Tidak ada deskripsi.',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


Widget _requirementRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    ),
  );
}

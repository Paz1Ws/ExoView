import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/presentation/screens/home/providers/exoplanet_providers.dart';

void showFilterModal(BuildContext context, WidgetRef ref) {
  final List<String> exoplanetCategories = [
    'All Exoplanets',
    'Super Earths',
    'Water Worlds',
    'Rocky Planets',
    'Gas Giants',
    'Neptunians',
  ];

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1), () async {
          return await ref.read(localExoplanetsProvider.future);
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pop(); // Close the dialog
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  final data = snapshot.data;
                  return data!.fold(
                    (failure) =>
                        Center(child: Text('Error: ${failure.message}')),
                    (exoplanets) {
                      return Container(
                        padding: const EdgeInsets.all(18),
                        color: AppColors.veryDarkPurple,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Filter By',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  IconButton(
                                    icon:
                                        Icon(Icons.close, color: Colors.white),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  )
                                ],
                              ),
                              ...exoplanetCategories.map((category) {
                                return ListTile(
                                    title: Text(
                                      category,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onTap: () {});
                              }).toList(),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            });
            return Container(); // Return an empty container after closing the dialog
          }
        },
      );
    },
  );
}

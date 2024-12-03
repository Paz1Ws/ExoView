import 'dart:isolate';
import 'package:hive/hive.dart';
import 'package:myapp/core/data/data.dart';

void storeExoplanetsInIsolate(SendPort sendPort) async {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  await for (final message in receivePort) {
    final List<Exoplanet> exoplanets = message[0];
    final Box box = message[1];
    final SendPort replyPort = message[2];

    final existingExoplanets = box.get('exoplanets') as List<dynamic>? ?? [];
    final existingExoplanetIds = existingExoplanets
        .map((e) =>
            Exoplanet.fromJson(Map<String, dynamic>.from(e as Map)).planetName)
        .toSet();

    final newExoplanets = <Map<String, dynamic>>[];
    for (var exoplanet in exoplanets) {
      if (!existingExoplanetIds.contains(exoplanet.planetName)) {
        newExoplanets.add(exoplanet.toJson());
        existingExoplanetIds.add(exoplanet.planetName);
      }
    }

    existingExoplanets.addAll(newExoplanets);
    box.put('exoplanets', existingExoplanets);

    replyPort.send('done');
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/tourist_place.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sitios Turísticos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TouristScreen(),
    );
  }
}

class TouristScreen extends StatefulWidget {
  const TouristScreen({super.key});

  @override
  State<TouristScreen> createState() => _TouristScreenState();
}

class _TouristScreenState extends State<TouristScreen> {
  final List<TouristPlace> places = [
    TouristPlace(
      name: 'Mitad del Mundo',
      location: 'Quito',
      description: 'Monumento ubicado sobre la línea ecuatorial.',
      image: 'assets/images/mitad.jpg',
      latitude: -0.0022,
      longitude: -78.4558,
    ),
    TouristPlace(
      name: 'Quilotoa',
      location: 'Latacunga',
      description: 'Laguna volcánica de impresionante belleza.',
      image: 'assets/images/quilotoa.jpg',
      latitude: -0.8583,
      longitude: -78.8997,
    ),
    TouristPlace(
      name: 'Cotopaxi',
      location: 'Ecuador',
      description: 'Uno de los volcanes activos más altos del mundo.',
      image: 'assets/images/cotopaxi.jpg',
      latitude: -0.6800,
      longitude: -78.4370,
    ),
    TouristPlace(
      name: 'Baños',
      location: 'Tungurahua',
      description:
          'Ciudad turística famosa por cascadas y deportes extremos.',
      image: 'assets/images/banios.jpg',
      latitude: -1.3969,
      longitude: -78.4247,
    ),
    TouristPlace(
      name: 'Galápagos',
      location: 'Ecuador',
      description: 'Archipiélago reconocido por su biodiversidad.',
      image: 'assets/images/galapagos.jpg',
      latitude: -0.9538,
      longitude: -90.9656,
    ),
    TouristPlace(
      name: 'Cuenca',
      location: 'Azuay',
      description: 'Ciudad patrimonial del Ecuador.',
      image: 'assets/images/cuenca.jpg',
      latitude: -2.9001,
      longitude: -79.0059,
    ),
    TouristPlace(
      name: 'Mindo',
      location: 'Pichincha',
      description: 'Destino ideal para observación de aves.',
      image: 'assets/images/mindo.jpg',
      latitude: 0.0500,
      longitude: -78.7833,
    ),
    TouristPlace(
      name: 'Chimborazo',
      location: 'Riobamba',
      description: 'La montaña más alta del Ecuador.',
      image: 'assets/images/chimborazo.jpg',
      latitude: -1.4692,
      longitude: -78.8174,
    ),
    TouristPlace(
      name: 'Otavalo',
      location: 'Imbabura',
      description: 'Conocido por su mercado artesanal.',
      image: 'assets/images/otavalo.jpg',
      latitude: 0.2346,
      longitude: -78.2625,
    ),
    TouristPlace(
      name: 'Cuyabeno',
      location: 'Amazonía',
      description: 'Reserva natural con gran biodiversidad.',
      image: 'assets/images/cuyabeno.jpg',
      latitude: -0.0200,
      longitude: -76.2000,
    ),
  ];

  Future<void> openMap(double latitude, double longitude) async {
    final Uri url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('10 Sitios Turísticos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];

          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  place.image,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                ListTile(
                  title: Text(
                    place.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(place.location),
                  trailing: IconButton(
                    icon: Icon(
                      place.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        place.isFavorite = !place.isFavorite;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(place.description),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Latitud: ${place.latitude}\nLongitud: ${place.longitude}',
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () {
                          openMap(
                            place.latitude,
                            place.longitude,
                          );
                        },
                        icon: const Icon(Icons.location_on),
                        label: const Text('Ver en Google Maps'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
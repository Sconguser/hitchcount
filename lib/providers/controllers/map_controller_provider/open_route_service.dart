import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenRouteService {
  final String apiKey =
      '5b3ce3597851110001cf6248aa2f936c70bc4f97a135d80cbe478e92';

  Future<double?> getDistance({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
  }) async {
    final String url =
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=$startLng,$startLat&end=$endLng,$endLat';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final distanceInMeters =
            data['features'][0]['properties']['segments'][0]['distance'];
        // double distanceInMeters = double.parse(distanceInMetersString);
        // final distanceInMeters = data['routes'][0]['summary']['distance'];
        // Convert meters to kilometers
        return distanceInMeters / 1000;
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Failed to get distance: $e');
      return null;
    }
  }
}

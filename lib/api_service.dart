import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';

import 'data.dart';

final httpClient = Dio(BaseOptions(baseUrl: 'https://api.neshan.org/v4/'));
// https://api.neshan.org/v4/direction/origin=147,45&destination=23,78
class ApiService {
  static Future<NeshanResponse> getDirections(
      LatLng origin, LatLng destination) async {
    final response = await httpClient.get(
        'direction?origin=35.7219,51.3347&destination=35.7932,51.3229',
        options: Options(
            headers: {'Api-Key': 'service.c8adb09f96134bb2b9eba50d80736bb3'}));
    final points = response.data['routes'][0]['overview_polyline']['points'];
    return NeshanResponse(response.data['routes'][0]['legs'][0], points);
  }
}


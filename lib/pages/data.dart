class NeshanResponse {
  final String duration;
  final String distance;
  final String summary;
  final String points;

  NeshanResponse(Map<String, dynamic> json, this.points)
      : duration = json['duration']['text'],
        distance = json['distance']['text'],
        summary = json['summary'];
}

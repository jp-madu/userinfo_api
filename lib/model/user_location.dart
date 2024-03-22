class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationCordinate coordinates;
  final LocationTimezone timezone;
  final LocationStreet street;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
    required this.street,
  });

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final coordinates = LocationCordinate.fromMap(
      json['coordinates'],
    );
    final timezone = LocationTimezone.fromMap(
      json['timezone'],
    );
    final street = LocationStreet.fromMap(
      json['street'],
    );
    return UserLocation(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(),
      coordinates: coordinates,
      timezone: timezone,
      street: street,
    );
  }
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({
    required this.number,
    required this.name,
  });

  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(
      number: json['number'],
      name: json['name'],
    );
  }
}

class LocationCordinate {
  final String latitude;
  final String longitude;
  LocationCordinate({
    required this.latitude,
    required this.longitude,
  });

  factory LocationCordinate.fromMap(Map<String, dynamic> json) {
    return LocationCordinate(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class LocationTimezone {
  final String offset;
  final String description;
  LocationTimezone({
    required this.offset,
    required this.description,
  });

  factory LocationTimezone.fromMap(Map<String, dynamic> json) {
    return LocationTimezone(
      offset: json['offset'],
      description: json['description'],
    );
  }
}

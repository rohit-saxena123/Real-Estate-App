class property_listing {
  final String id;
  final String furnishing;
  final String listed_by;
  final String builtparea;
  final String carpetarea;
  final String maintenance;
  final String carparking;
  final String washrooms;
  final String projectname;
  final String adtitle;
  final String whatusale;
  final String image;
  final String location;
  final String cabins;
  final String meeting_rooms;
  final String lifts;
  final String office_type;
  final String looking_for;
  final String office_capacity;
  final String budget;
  final String floor;

  property_listing({
    required this.id,
    required this.furnishing,
    required this.listed_by,
    required this.builtparea,
    required this.carpetarea,
    required this.maintenance,
    required this.carparking,
    required this.washrooms,
    required this.projectname,
    required this.adtitle,
    required this.whatusale,
    required this.image,
    required this.location,
    required this.cabins,
    required this.meeting_rooms,
    required this.lifts,
    required this.office_type,
    required this.looking_for,
    required this.office_capacity,
    required this.budget,
    required this.floor,
});



  factory property_listing.fromJson(Map<String, dynamic> json){
    return property_listing(
        id: json['id'],
        furnishing: json['furnishing'],
        listed_by:  json['listed_by'],
      builtparea: json['builtparea'],
        carpetarea:  json['carpetarea'],
        maintenance: json['maintenance'],
        carparking:  json['carparking'],
        washrooms:  json['washrooms'],
        projectname: json['projectname'],
        adtitle:  json['adtitle'],
        whatusale: json['whatyousale'],
        image: json['image'],
      location: json['location'],
      cabins: json['cabins'],
      meeting_rooms: json['meeting_rooms'],
      lifts: json['lifts'],
      office_type: json['office_type'],
      looking_for: json['looking_for'],
      office_capacity: json['office_capacity'],
      budget: json['budget'],
      floor: json['floor'],
    );
  }
}


class office_file{
  final String id;
  final String location;
  final String cabin;
  final String meeting_rooms;
  final String lifts;
  final String type_of_office;
  final String looking_for;
  final String capacity;
  final String furnishing;
  final String listed_by;
  final String builtp_area;
  final String carpet_area;
  final String maintenance;
  final String floor;
  final String car_parking;
  final String washrooms;
  final String project_name;
  final String adtitle;
  final String whatusale;
  final String budget;
  final String image;

  office_file({
    required this.id,
    required this.location,
    required this.cabin,
    required this.meeting_rooms,
    required this.lifts,
    required this.type_of_office,
    required this.looking_for,
    required this.capacity,
    required this.furnishing,
    required this.listed_by,
    required this.builtp_area,
    required this.carpet_area,
    required this.maintenance,
    required this.floor,
    required this.car_parking,
    required this.washrooms,
    required this.project_name,
    required this.adtitle,
    required this.whatusale,
    required this.budget,
    required this.image,


});

  factory office_file.fromjson(Map<String, dynamic> json){
    return office_file(
        id: json['id'],
        location: json['location'],
        cabin: json['cabin'],
        meeting_rooms:json['meeting_rooms'],
        lifts: json['lifts'],
        type_of_office:json['type_of_office'],
        looking_for: json['looking_for'],
        capacity: json['capacity'],
        furnishing: json['furnishing'],
        listed_by: json['listed_by'],
        builtp_area: json['builtp_area'],
        carpet_area: json['carpet_area'],
        maintenance: json['maintenance'],
        floor: json['floor'],
        car_parking: json['car_parking'],
        washrooms: json['washrooms'],
        project_name: json['project_name'],
        adtitle: json['adtitle'],
        whatusale: json['whatusale'],
        budget: json['budget'],
        image: json['image'],

    );
  }

}
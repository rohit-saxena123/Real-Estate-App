class register  {

final String name;
final String number;
final String email;
final String password;

register({
  required this.name,
  required this.number,
  required this.email,
  required this.password,

});

  factory register.fromJson(Map<String, dynamic> rohit){
    return register(
        name: rohit['name'],
        number: rohit['number'],
        email: rohit['email'],
        password: rohit['password'],

    );
  }

}



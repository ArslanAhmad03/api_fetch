

class MyData{
  int? id;
  String? firstName;
  String? maidenName;
  String? lastName;
  int? age;
  String? gender;

  MyData({this.id, this.firstName, this.maidenName, this.lastName, this.age, this.gender});

  MyData.fromJson(Map<String, dynamic>json){
    id = json['id'];
    firstName = json['firstName'];
    maidenName = json['maidenName'];
    lastName = json['lastName'];
    age = json['age'];
    gender = json['gender'];
  }

 }
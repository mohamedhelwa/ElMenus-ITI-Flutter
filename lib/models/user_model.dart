class UserModel {
  String _name,_email,_id ;
  Map<String,bool> _userType ;

  UserModel(this._id,this._name,this._email,this._userType,);


  UserModel.fromMap(Map<String,dynamic> data){
    _id = data["uid"] ;
    _name = data["name"];
    _email = data["email"] ;
    _userType = data["roles"];

  }

  Map<String,dynamic> toMap()=>{
    "uid":_id ,
    "name":_name ,
    "email":_email ,
    "roles" : _userType,
  };

  get id => _id;

  set id(value) {
    _id = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  String get name => _name;

  set setName(String value) {
    _name = value;
  }
  Map<String,bool> get checkUserType => _userType;

  set setCheckUserTyp(Map<String,bool> value) {
    _userType = value;
  }
}
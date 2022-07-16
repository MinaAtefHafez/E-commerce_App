

class UserModel {
  String? name ;
  String? email ;
  String? image ;

  UserModel ( {
    required this.name ,
    required this.email ,
     this.image ,
  } );

   
   UserModel.fromJson ( Map <String,dynamic> json ) {
        name = json['name'] ;
        email = json ['email'] ;
        image = json['image'] ;
   }


   Map <String,dynamic> toMap () {
     return {
      'name' : name ,
      'email' : email ,
       'image' : image
     };
   }

}



class PricesModel {
  
  double? price ;
  int? number; 

  PricesModel.fromJson (Map <String,dynamic> json) {

       price = json['price'] ;
       number = json ['number'] ;
  }

}
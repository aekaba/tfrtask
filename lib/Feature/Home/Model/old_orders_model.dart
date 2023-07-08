class OldOrders {
  int? count;
  int? next;
  int? previous;
  List<Results>? results;

  OldOrders({this.count, this.next, this.previous, this.results});

  OldOrders.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  String? id;
  int? status;
  String? deliveredDate;
  String? atCustomerDate;
  String? receivedDate;
  String? atRestaurantDate;
  PopulatedOrder? populatedOrder;
  PopulatedDriver? populatedDriver;
  double? extraTipFromTfr;
  double? tipFromRestaurant;
  double? extraTipFromRestaurant;
  double? tipFromTfr;
  bool? isCustomerCallable;

  Results(
      {this.id,
      this.status,
      this.deliveredDate,
      this.atCustomerDate,
      this.receivedDate,
      this.atRestaurantDate,
      this.populatedOrder,
      this.populatedDriver,
      this.extraTipFromTfr,
      this.tipFromRestaurant,
      this.extraTipFromRestaurant,
      this.tipFromTfr,
      this.isCustomerCallable});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    deliveredDate = json['delivered_date'];
    atCustomerDate = json['at_customer_date'];
    receivedDate = json['received_date'];
    atRestaurantDate = json['at_restaurant_date'];
    populatedOrder = json['populated_order'] != null
        ? PopulatedOrder.fromJson(json['populated_order'])
        : null;
    populatedDriver = json['populated_driver'] != null
        ? PopulatedDriver.fromJson(json['populated_driver'])
        : null;
    extraTipFromTfr = json['extra_tip_from_tfr'];
    tipFromRestaurant = json['tip_from_restaurant'];
    extraTipFromRestaurant = json['extra_tip_from_restaurant'];
    tipFromTfr = json['tip_from_tfr'];
    isCustomerCallable = json['is_customer_callable'];
  }
}

class PopulatedOrder {
  String? id;
  String? orderNumber;
  int? status;
  String? deliverDate;
  String? pickupDate;
  int? driverCount;
  int? tipFromTfr;
  String? file;
  String? noteForDriver;
  int? extraTipFromTfr;
  double? tipFromRestaurant;
  double? extraTipFromRestaurant;
  PopulatedRestaurant? populatedRestaurant;

  PopulatedOrder(
      {this.id,
      this.orderNumber,
      this.status,
      this.deliverDate,
      this.pickupDate,
      this.driverCount,
      this.tipFromTfr,
      this.file,
      this.noteForDriver,
      this.extraTipFromTfr,
      this.tipFromRestaurant,
      this.extraTipFromRestaurant,
      this.populatedRestaurant});

  PopulatedOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    status = json['status'];
    deliverDate = json['deliver_date'];
    pickupDate = json['pickup_date'];
    driverCount = json['driver_count'];
    tipFromTfr = json['tip_from_tfr'];
    file = json['file'];
    noteForDriver = json['note_for_driver'];
    extraTipFromTfr = json['extra_tip_from_tfr'];
    tipFromRestaurant = json['tip_from_restaurant'];
    extraTipFromRestaurant = json['extra_tip_from_restaurant'];
    populatedRestaurant = json['populated_restaurant'] != null
        ? PopulatedRestaurant.fromJson(json['populated_restaurant'])
        : null;
  }
}

class PopulatedRestaurant {
  String? id;
  String? name;
  String? address;
  String? phone;

  PopulatedRestaurant({this.id, this.name, this.address, this.phone});

  PopulatedRestaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
  }
}

class PopulatedDriver {
  String? id;
  User? user;
  bool? isActive;
  String? deletedAt;
  String? note;
  String? city;

  PopulatedDriver(
      {this.id,
      this.user,
      this.isActive,
      this.deletedAt,
      this.note,
      this.city});

  PopulatedDriver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    isActive = json['is_active'];
    deletedAt = json['deleted_at'];
    note = json['note'];
    city = json['city'];
  }
}

class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? isActive;
  int? type;
  String? phone;
  List<int>? groups;
  List<void>? userPermissions;

  User(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.isActive,
      this.type,
      this.phone,
      this.groups,
      this.userPermissions});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    isActive = json['is_active'];
    type = json['type'];
    phone = json['phone'];
    groups = json['groups'].cast<int>();
    if (json['user_permissions'] != null) {
      userPermissions = <Null>[];
      json['user_permissions'].forEach((v) {
        userPermissions!.add(null);
      });
    }
  }
}

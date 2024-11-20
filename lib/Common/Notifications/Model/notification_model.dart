

class NotificationData {
/*
{
  "id": 1,
  "sender_id": 2,
  "receiver_id": 15,
  "type": "Accepted",
  "post_id": 2,
  "message": "Lorem Ipsum dollor smit",
  "read_at": "2024-07-05 07:52:59",
  "created_at": null,
  "updated_at": "2024-07-05T07:52:59.000000Z",
  "user": {
    "id": 2,
    "first_name": "alpha",
    "last_name": "dsfasd",
    "profile_image": "profile_image/9RxjuxPpcUoQf4xaHEK4gZRhGZPIIJbywNvakljR.jpg"
  }
} 
*/

  int? id;
  int? senderId;
  int? receiverId;
  String? type;
  int? postId;
  String? message;
  String? readAt;
  String? createdAt;
  String? updatedAt;
  UserData? user;

  NotificationData({
    this.id,
    this.senderId,
    this.receiverId,
    this.type,
    this.postId,
    this.message,
    this.readAt,
    this.createdAt,
    this.updatedAt,
    this.user,
  });
}

class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? profileImage;

  UserData({
    this.id,
    this.firstName,
    this.lastName,
    this.profileImage,
  });
}


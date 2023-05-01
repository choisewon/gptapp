class ChatModel {
  final int chat_room_id;
  final String msg;
  final int chatIndex;

  ChatModel(
      {required this.chat_room_id, required this.msg, required this.chatIndex});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
      chat_room_id: json["chatRoom"],
      msg: json["msg"],
      chatIndex: json["chatIndex"]);

  Map<String, dynamic> toMap() => {
    'roomid': this.chat_room_id,
    'chat': this.msg,
    'subject': this.chatIndex
  };
}

class ChatRoomModel {
  final String title;
  List<ChatModel> chatlist = [];

  ChatRoomModel({required this.title});

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      ChatRoomModel(title: json["title"]);

  Map<String, dynamic> toMap() => {'title': this.title};

  List<ChatModel> get_chat() {
    return this.chatlist;
  }

  void add(ChatModel msg) {
    this.chatlist.add(msg);
  }
}
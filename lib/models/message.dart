class Message {
  Message({
    required this.toId,
    required this.msg,
    required this.read,
    required this.fromId,
    required this.sent,
    required this.type,
  });
  late final String toId;
  late final String msg;
  late final String read;
  late final String fromId;
  late final String sent;
  late final Type type;

  Message.fromJson(Map<String, dynamic> json) {
    toId = json['toId'].toString();
    msg = json['msg'].toString();
    read = json['read'].toString();
    fromId = json['fromId'].toString();
    sent = json['sent'].toString();
    type = json['type'].toString() == Type.image.name ? Type.image : Type.text;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['toId'] = toId;
    _data['msg'] = msg;
    _data['read'] = read;
    _data['fromId'] = fromId;
    _data['sent'] = sent;
    _data['type'] = type.name;
    return _data;
  }
}

enum Type { text, image }

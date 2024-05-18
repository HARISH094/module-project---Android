class MessageResponse {

  MessageResponse({
    required this.responseCode,
    required this.response,
  });

  dynamic responseCode;
  dynamic? response;

  MessageResponse.fromJson(Map<String, dynamic> json){
    responseCode = json['response_code'];
    response = json['response_message']!=null ? json['response_message'] : "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['response_code'] = responseCode;
    _data['response_message'] = response;
    return _data;
  }

}
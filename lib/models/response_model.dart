class ResponseModel {
  final bool _isSuccess;
  final String _message;

  ResponseModel(this._message, this._isSuccess);

  String message() {
    return _message;
  }

  bool isSuccess() {
    return _isSuccess;
  }
}

class CommonResponse<T> {
  final bool isSuccess;
  final String message;
  final T? response;
  CommonResponse(
      {required this.isSuccess, required this.message, required this.response});
}

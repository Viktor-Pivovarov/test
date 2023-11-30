enum StateStatus {
  /// The form has not been touched.
  pure,

  firstFetchingInProgress,

  fetchingInProgress,

  /// The form has been submitted successfully.
  fetchingSuccess,

  /// The form fetching failed.
  fetchingFailure,

  finish;

  /// Indicates whether the form is untouched.
  bool get isPure => this == StateStatus.pure;

  /// Indicates whether the form is in the process of being submitted.
  bool get isFirstFetchingInProgress =>
      this == StateStatus.firstFetchingInProgress;

  bool get isFetchingInProgress => this == StateStatus.fetchingInProgress;

  /// Indicates whether the form has been submitted successfully.
  bool get isFetchingSuccess => this == StateStatus.fetchingSuccess;

  /// Indicates whether the form fetching failed.
  bool get isFetchingFailure => this == StateStatus.fetchingFailure;

  bool get isFinish => this == StateStatus.finish;
}

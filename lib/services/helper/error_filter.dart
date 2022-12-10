class ErrorFilter{
  /// Filter the Firebase Auth error
  ///
  /// Args:
  ///   errorCode (String): The error code returned by the Firebase API.
  ///
  /// Returns:
  ///   A string that is the error message.
  static String filterFirebaseAuthError(String errorCode) {
    String errorMessage = "";
    switch (errorCode) {
      case "email-already-exists":
        errorMessage = "Email was already exists";
        break;
      case "email-already-in-use":
        errorMessage = "Email was already in use";
        break;
      case "invalid-email":
        errorMessage = "Email is invalid";
        break;
      case "user-disabled":
        errorMessage = "User was disabled";
        break;
      case "user-not-found":
        errorMessage = "User was not found";
        break;
      case "wrong-password":
        errorMessage = "Password was wrong";
        break;
      case "weak-password":
        errorMessage = "Password was weak";
        break;
      case "operation-not-allowed":
        errorMessage = "Operation was not allowed";
        break;
      case "too-many-requests":
        errorMessage = "Too many requests";
        break;
      case "account-exists-with-different-credential":
        errorMessage = "Account exists with different credential";
        break;
      case "requires-recent-login":
        errorMessage = "Requires recent login";
        break;
      case "credential-already-in-use":
        errorMessage = "Credential already in use";
        break;
      case "invalid-credential":
        errorMessage = "Credential is invalid";
        break;
      case "invalid-verification-code":
        errorMessage = "Verification code is invalid";
        break;
      case "invalid-verification-id":
        errorMessage = "Verification id is invalid";
        break;
      case "provider-already-linked":
        errorMessage = "Provider already linked";
        break;
      case "provider-not-linked":
        errorMessage = "Provider not linked";
        break;
      case "session-expired":
        errorMessage = "Session expired";
        break;
      case "missing-verification-code":
        errorMessage = "Missing verification code";
        break;
      case "missing-verification-id":
        errorMessage = "Missing verification id";
        break;
      case "missing-phone-number":
        errorMessage = "Missing phone number";
        break;
      case "invalid-phone-number":
        errorMessage = "Phone number is invalid";
        break;
      case "id-token-expired":
        errorMessage = "Id token expired";
        break;
      case "user-token-expired":
        errorMessage = "User token expired";
        break;

      default:
        errorMessage = "An undefined Error happened.";
    }
    return errorMessage;
  }

  /// Filter the Firebase Storage error
  ///
  /// Args:
  ///   errorCode (String): The error code that was returned by the Firebase Storage
  /// API.
  ///
  /// Returns:
  ///   A string that is the error message.
  static String filterFirebaseStorageError(String errorCode){
    String errorMessage = "";
    switch (errorCode) {
      case 'object-not-found':
        errorMessage = "No object exists at the desired reference.";
        break;
      case 'bucket-not-found':
        errorMessage = "No bucket is configured for Cloud Storage.";
        break;
      case 'project-not-found':
        errorMessage = "No project is configured for Cloud Storage.";
        break;
      case 'quota-exceeded':
        errorMessage = "Quota for bucket exceeded.";
        break;
      case 'unauthenticated':
        errorMessage = "User is unauthenticated, please authenticate and try again.";
        break;
      case 'unauthorized':
        errorMessage = "User is unauthenticated, please authenticate and try again.";
        break;
      case 'retry-limit-exceeded':
        errorMessage = "Max retry time for operation exceeded, please try again.";
        break;
      case 'invalid-checksum':
        errorMessage = "File on the client does not match the checksum of the file received by the server.";
        break;
      case 'cancelled':
        errorMessage = "User cancelled the upload/download.";
        break;
      case 'invalid-event-name':
        errorMessage = "Invalid event name provided. Must be one of [`running`, `progress`, `pause`].";
        break;
      case 'invalid-url':
        errorMessage = "Invalid URL provided.";
        break;
      case 'invalid-argument':
        errorMessage = "Invalid argument provided in function call.";
        break;
      case 'no-default-bucket':
        errorMessage = "No bucket has been set in your config's storageBucket property.";
        break;
      case 'cannot-slice-blob':
        errorMessage = "Commonly occurs when the local file has changed during the upload.";
        break;
      case 'server-file-wrong-size':
        errorMessage = "Server recorded incorrect upload file size, please retry the upload.";
        break;
      default:
        errorMessage = "An unknown error occurred.";
    }
    return errorMessage;
  }


  /// Filter the firebase firestore error
  static String filterFirebaseFirestoreError(String errorCode){
    String errorMessage = "";
    switch (errorCode) {
      case "cancelled":
        errorMessage = "The operation was cancelled";
        break;
      case "unknown":
        errorMessage = "Unknown error or an error from a different error domain";
        break;
      case "invalid-argument":
        errorMessage = "Client specified an invalid argument";
        break;
      case "deadline-exceeded":
        errorMessage = "Deadline expired before operation could complete";
        break;
      case "not-found":
        errorMessage = "Some requested document was not found";
        break;
      case "already-exists":
        errorMessage = "Some document that we attempted to create already exists";
        break;
      case "permission-denied":
        errorMessage = "The caller does not have permission to execute the specified operation";
        break;
      case "resource-exhausted":
        errorMessage = "Some resource has been exhausted, please retry after some time";
        break;
      case "failed-precondition":
        errorMessage = "Operation was rejected because the system is not in a state required for the operation's execution";
        break;
      case "aborted":
        errorMessage = "The operation was aborted, typically due to a concurrency issue like transaction aborts, etc";
        break;
      case "out-of-range":
        errorMessage = "Operation was attempted past the valid range";
        break;
      case "unimplemented":
        errorMessage = "Operation is not implemented or not supported/enabled";
        break;
      case "internal":
        errorMessage = "Some invariants expected by underlying System has been broken.";
        break;
      case "unavailable":
        errorMessage = "The service is currently unavailable";
        break;
      case "data-loss":
        errorMessage = "Unrecoverable data loss or corruption";
        break;
      case "unauthenticated":
        errorMessage = "The request does not have valid authentication credentials for the operation";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }
    return errorMessage;
  }
}
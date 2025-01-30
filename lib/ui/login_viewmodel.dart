class LoginViewModel {
  //variable data
  String apiData = 'FETCH FROM API LOADING';

  LoginViewModel();

  //function
  void apiCall() {
    // ---- 1sec
    //5sec
    apiData = 'FETCH FROM API SUCCESSFUL';
    // screen update
    //setState{}
  }
}

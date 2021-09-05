// Base Url
var baseUrl = "https://lms.webmyidea.com";

// Base API Url
var baseApi = baseUrl + "/api";

// Authentication endpoints
var loginUrl = baseApi + "/login";
var registerUrl = baseApi + "/register";
var logoutUrl = baseApi + "/logout";

// Student profile
showProfileUrl(id) {
  return baseApi + "/show/" + id.toString();
}

updateProfileUrl(id) {
  return baseApi + "/update/" + id.toString();
}

// Lecture
showLecturesUrl(lectureId) {
  return baseApi + "/lectures/" + lectureId.toString();
}

downloadLecturesUrl(lectureId) {
  return baseApi + "/lectures/" + lectureId.toString() + "/download";
}

// Years
var showYearsUrl = baseApi + "/years";

// Semesters
var baseSemesters = baseApi + "/semesters/";
// Courses
showCourses(id) {
  return baseApi + "/courses/" + id.toString();
}

// Search
var searchUrl = baseApi + "/search";

// Routes
var homePageRoute = '/intro';
var profileRoute = '/profile';
var signInRoute = '/sign_in';
var registerRoute = '/register';
var semRoute = '/home';
var bottombarRoute = '/layout';

// API call headers
Map<String, String> requestHeadersNoAuth = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

Map<String, String> requestHeadersWithAuth(token) {
  return {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };
}

Map<String, String> searchHeadersWithAuth(token, query) {
  return {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token",
    'q': query
  };
}

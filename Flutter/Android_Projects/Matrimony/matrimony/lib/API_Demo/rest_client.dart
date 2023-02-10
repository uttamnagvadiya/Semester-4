import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://630c3f0f53a833c534263375.mockapi.io/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/FacultyProject")
  Future<String> getUsersDataFromRestApi();

  @POST("/FacultyProject")
  @FormUrlEncoded()
  Future<String> insertUserDataIntoApi(
        @Field('FacultyName') name,
        @Field('FacultyDesignation') designation,
        @Field('FacultyQualification') qualification,
        @Field('FacultyExperience') experience,
        @Field('FacultyWorkingSince') working,
        @Field('FacultyMobileNumber') mobilenumber,
        @Field('FacultyEmail') email,
        @Field('FacultySeating') seating,
      );
}
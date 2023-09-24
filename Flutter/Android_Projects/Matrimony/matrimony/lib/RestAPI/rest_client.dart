//region Import Statements...
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
//endregion

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://630c3f0f53a833c534263375.mockapi.io/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //region GET DATA FROM API
  @GET("/FacultyProject")
  Future<dynamic> getUsersDataFromRestApi();
  //endregion

  //region POST DATA INTO API
  @POST("/FacultyProject")
  @FormUrlEncoded()
  Future<dynamic> insertUserDataIntoApi(
    @Field('FacultyName') name,
    @Field('FacultyDesignation') designation,
    @Field('FacultyQualification') qualification,
    @Field('FacultyExperience') experience,
    @Field('FacultyWorkingSince') working,
    @Field('FacultyMobileNumber') mobilenumber,
    @Field('FacultyEmail') email,
    @Field('FacultySeating') seating,
  );
  //endregion

  //region DELETE DATA FROM API
  @DELETE("/FacultyProject/{id}")
  Future<dynamic> deleteUserDataIntoApi(@Path("id") id);
  //endregion

  //region PUT DATA INTO API
  @PUT("/FacultyProject/{id}")
  Future<dynamic> updateUserDataIntoApi(@Path("id") id, @Body() map);
  //endregion
}

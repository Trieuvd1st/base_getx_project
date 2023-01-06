
import 'package:retrofit/http.dart';

abstract class ApiService {
  @GET("/products")
  Future<List<int>> getProducts();
}
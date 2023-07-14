import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:sea_cinema_frontend/app/data/data.dart';
import 'package:sea_cinema_frontend/app/shared/shared.dart';

part 'auth_services.dart';
part 'movie_services.dart';
part 'showtime_services.dart';
part 'transaction_services.dart';

// String baseURL = 'http://10.0.2.2:8000';
String baseURL = 'https://api-sea-cinema.auroraweb.id';

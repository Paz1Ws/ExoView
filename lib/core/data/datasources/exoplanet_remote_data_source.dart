import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/core/data/data.dart';

abstract interface class ExoplanetRemoteDataSource {
  Future<Either<Failure, List<Exoplanet>>> getExoplanets(
      int year, int currentYear);
}

class ExoplanetRemoteDataSourceImpl implements ExoplanetRemoteDataSource {
  @override
  Future<Either<Failure, List<Exoplanet>>> getExoplanets(
      int year, int currentYear) async {
    final url =
        'https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,pl_controv_flag,disc_year,discoverymethod,pl_orbper,pl_rade,pl_bmasse,pl_eqt,pl_dens,pl_trandur,pl_insol,hostname,st_spectype,st_teff,st_rad,st_mass,st_age,st_vsin,sy_dist,sy_snum,sy_mnum,sy_pnum+from+ps+where+disc_year=$year&format=json';
    final result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(result.body);
      final List<Exoplanet> exoplanets =
          jsonList.map((json) => Exoplanet.fromJson(json)).toList();

      return Right(exoplanets);
    } else {
      return Left(Failure("Check http conection."));
    }
  }
}

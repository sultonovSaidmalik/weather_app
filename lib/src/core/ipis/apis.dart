sealed class Apis {
  static const baseUrl = "https://api.openweathermap.org";
  static const weather =
      "/data/3.0/onecall";

  static Map<String, String> query({
    double lat = 50.4501,
    double lon = 30.5234,
    String appid = "da39af308c2b9dc7fef181ff65823767",

  }) =>
      {
        "lat": lat.toString(),
        "lon": lon.toString(),
        "appid": appid,
        "units" : "metric"
      };
}

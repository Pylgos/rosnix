{
  buildCatkinPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  nmea-msgs,
  novatel-oem7-msgs,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
}:
buildCatkinPackage (finalAttrs: {
  pname = "novatel_oem7_driver";
  version = "4.3.0-2";
  src = finalAttrs.passthru.sources."novatel_oem7_driver";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "catkin" ]; };
  propagatedNativeBuildInputs = [ nav-msgs nmea-msgs novatel-oem7-msgs sensor-msgs tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "gps_common" "nodelet" "roscpp" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "catkin" ]; };
  propagatedBuildInputs = [ nav-msgs nmea-msgs novatel-oem7-msgs sensor-msgs tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "gps_common" "nodelet" "roscpp" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "rosbag" "rostest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "novatel_oem7_driver" = substituteSource {
      src = fetchgit {
        name = "novatel_oem7_driver-source";
        url = "https://github.com/novatel-gbp/novatel_oem7_driver-release.git";
        rev = "4e5fd40985ef3807ebad4e349377308b4c3508d4";
        hash = "sha256-CsGfZrcKwkDlqlEfRC67X2CcH4PT3D3Q/ObIXCZA01A=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/novatel/novatel_edie";
          to = "URL ${sources."novatel_oem7_driver/novatel_edie"}";
        }
      ];
    };
    "novatel_oem7_driver/novatel_edie" = substituteSource {
      src = fetchgit {
        name = "novatel_edie-source";
        url = "https://github.com/novatel/novatel_edie";
        rev = "690d2a88e5eb8e0ad4a04e5ae0706e8b67fdb947";
        hash = "sha256-w2huRuu81NQOvjuuGP+6OF1lwxMydsWLQCsyJIDsR00=";
      };
    };
  });
  meta = {
    description = "NovAtel Oem7 ROS Driver";
  };
})

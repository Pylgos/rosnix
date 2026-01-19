{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
  data-tamer-cpp,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plotjuggler";
  version = "3.14.4-1";
  src = finalAttrs.passthru.sources."plotjuggler";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp data-tamer-cpp rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "binutils" "boost" "fmt" "libqt5-opengl-dev" "libqt5-svg-dev" "libqt5-websockets-dev" "libqt5x11extras5-dev" "libzmq3-dev" "libzstd-dev" "lua-dev" "lz4" "nlohmann-json-dev" "protobuf-dev" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp data-tamer-cpp rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "binutils" "boost" "fmt" "libqt5-opengl-dev" "libqt5-svg-dev" "libqt5-websockets-dev" "libqt5x11extras5-dev" "libzmq3-dev" "libzstd-dev" "lua-dev" "lz4" "nlohmann-json-dev" "protobuf-dev" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "plotjuggler" = substituteSource {
      src = fetchgit {
        name = "plotjuggler-source";
        url = "https://github.com/ros2-gbp/plotjuggler-release.git";
        rev = "efa53c48ad28205bb49dd3675118c1cf5341ab41";
        hash = "sha256-smpN1wY7ktKCSkj7DQ89OAYRCtFOdEPitCWj/sc2jxM=";
      };
      substitutions = [
        {
          path = "3rdparty/date-3.0.4/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/HowardHinnant/date.git";
          to = "URL ${sources."plotjuggler/date"}";
        }
      ];
    };
    "plotjuggler/date" = substituteSource {
      src = fetchgit {
        name = "date-source";
        url = "https://github.com/HowardHinnant/date.git";
        rev = "6e921e1b1d21e84a5c82416ba7ecd98e33a436d0";
        hash = "sha256-ZSjeJKAcT7mPym/4ViDvIR9nFMQEBCSUtPEuMO27Z+I=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/HowardHinnant/date.git";
          to = "URL ${sources."plotjuggler/date/date"}";
        }
      ];
    };
    "plotjuggler/date/date" = substituteSource {
      src = fetchgit {
        name = "date-source";
        url = "https://github.com/HowardHinnant/date.git";
        rev = "cac99da8dc88be719a728dc1b597b0ac307c1800";
        hash = "sha256-U6JuAKePxoM1qtiF23ogLFAAKhtkIso/kkxp+b3pdOM=";
      };
    };
  });
  meta = {
    description = "PlotJuggler: juggle with data";
  };
})

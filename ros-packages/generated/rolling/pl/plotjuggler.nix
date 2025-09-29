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
  version = "3.12.0-1";
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
        rev = "f9905b2876c5edc014cc50b07c47f8cac0b84e4d";
        hash = "sha256-PDl1RTGTJI2rsWQDBqZBy82OQTzU8qLTRcSSv0vkn1I=";
      };
    };
  });
  meta = {
    description = "PlotJuggler: juggle with data";
  };
})

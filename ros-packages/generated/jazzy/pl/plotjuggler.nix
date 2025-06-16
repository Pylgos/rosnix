{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
  fastcdr,
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
  version = "3.10.6-1";
  src = finalAttrs.passthru.sources."plotjuggler";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp fastcdr rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "binutils" "boost" "libqt5-opengl-dev" "libqt5-svg-dev" "libqt5-websockets-dev" "libqt5x11extras5-dev" "libzmq3-dev" "libzstd-dev" "lua-dev" "lz4" "mosquittopp-dev" "nlohmann-json-dev" "protobuf-dev" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp fastcdr rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "binutils" "boost" "libqt5-opengl-dev" "libqt5-svg-dev" "libqt5-websockets-dev" "libqt5x11extras5-dev" "libzmq3-dev" "libzstd-dev" "lua-dev" "lz4" "mosquittopp-dev" "nlohmann-json-dev" "protobuf-dev" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "plotjuggler" = substituteSource {
      src = fetchgit {
        name = "plotjuggler-source";
        url = "https://github.com/ros2-gbp/plotjuggler-release.git";
        rev = "5e86549062e77e6330d440753056877a41bb0b8c";
        hash = "sha256-PEkQVYV0iU7f+yTKvNknATN5EkXbqt4Y05Lj5LYDqmc=";
      };
    };
  });
  meta = {
    description = "PlotJuggler: juggle with data";
  };
})

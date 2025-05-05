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
  version = "3.10.1-1";
  src = finalAttrs.passthru.sources."plotjuggler";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp rclcpp ];
  propagatedBuildInputs = [ fastcdr ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "binutils" "boost" "libqt5-opengl-dev" "libqt5-svg-dev" "libqt5-websockets-dev" "libqt5x11extras5-dev" "libzmq3-dev" "protobuf-dev" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "plotjuggler" = substituteSource {
      src = fetchgit {
        name = "plotjuggler-source";
        url = "https://github.com/ros2-gbp/plotjuggler-release.git";
        rev = "b62661177fde6f5f71412fdf53d1f714e5b6f567";
        hash = "sha256-hDfeBsp/TRWp/6durxYZ0MiPfT+F3botAg0umuytDFQ=";
      };
    };
  });
  meta = {
    description = "PlotJuggler: juggle with data";
  };
})

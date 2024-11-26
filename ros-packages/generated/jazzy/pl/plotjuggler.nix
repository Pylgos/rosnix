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
  version = "3.9.2-1";
  src = finalAttrs.passthru.sources."plotjuggler";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-cpp fastcdr rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "binutils" "boost" "libqt5-opengl-dev" "libqt5-svg-dev" "libqt5-websockets-dev" "libqt5x11extras5-dev" "libzmq3-dev" "libzstd-dev" "lz4" "protobuf-dev" "qtbase5-dev" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "plotjuggler" = substituteSource {
        src = fetchgit {
          name = "plotjuggler-source";
          url = "https://github.com/ros2-gbp/plotjuggler-release.git";
          rev = "243d8c1cf472c0d6cac26cc2ab34fad9f2bb0622";
          hash = "sha256-btYnAV/G2I+WURDeN8C6WfMHh79M4e4l5Ix9Zx7srrs=";
        };
      };
    });
  };
  meta = {
    description = "PlotJuggler: juggle with data";
  };
})

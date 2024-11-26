{
  actionlib-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  sensor-msgs,
  shape-msgs,
  std-msgs,
  std-srvs,
  stereo-msgs,
  substituteSource,
  trajectory-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "common_interfaces";
  version = "5.4.2-1";
  src = finalAttrs.passthru.sources."common_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ actionlib-msgs builtin-interfaces diagnostic-msgs geometry-msgs nav-msgs sensor-msgs shape-msgs std-msgs std-srvs stereo-msgs trajectory-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "common_interfaces" = substituteSource {
      src = fetchgit {
        name = "common_interfaces-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "6a685bf6b6ad51b6b854df39d5230a43edd6fdd9";
        hash = "sha256-8/nBGPX0SJJ/W0/e1eM1fAT/zAj/8eO24YTcLdc39ig=";
      };
    };
  });
  meta = {
    description = "common_interfaces contains messages and services that are widely used by other ROS packages.";
  };
})

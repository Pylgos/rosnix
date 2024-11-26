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
  version = "5.3.5-1";
  src = finalAttrs.passthru.sources."common_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ actionlib-msgs builtin-interfaces diagnostic-msgs geometry-msgs nav-msgs sensor-msgs shape-msgs std-msgs std-srvs stereo-msgs trajectory-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "common_interfaces" = substituteSource {
      src = fetchgit {
        name = "common_interfaces-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "d3cd7bc2ac70c1f793bb486b8890a3e705d51955";
        hash = "sha256-wxRD1b3gGcPbjpovwadMlw+A3m7bfdNsaOyxgcA/lSI=";
      };
    };
  });
  meta = {
    description = "common_interfaces contains messages and services that are widely used by other ROS packages.";
  };
})

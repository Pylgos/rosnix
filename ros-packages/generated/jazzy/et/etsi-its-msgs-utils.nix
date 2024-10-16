{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "etsi_its_msgs_utils" = substituteSource {
      src = fetchgit {
        name = "etsi_its_msgs_utils-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "ac30eb22c6938f64ca11d3e1f0962d1158db1af9";
        hash = "sha256-QYHZAUeM2/1uKQJD69/c3+d3hmGcqeVAJPp7hIyp/f0=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_msgs_utils";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_msgs_utils";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi-its-msgs geometry-msgs tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "ROS messages and utility functions for ETSI ITS messages";
  };
})

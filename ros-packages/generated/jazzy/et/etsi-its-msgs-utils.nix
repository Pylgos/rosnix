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
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_msgs_utils";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_msgs_utils";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-msgs geometry-msgs tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_msgs_utils" = substituteSource {
      src = fetchgit {
        name = "etsi_its_msgs_utils-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "1e07b5dacbde6a500a04aa3265ea4210fb8d4e96";
        hash = "sha256-XABk1c702rtTEfN3Y8/A6F3U+wkpll4oo2OIt0PpXFE=";
      };
    };
  });
  meta = {
    description = "ROS messages and utility functions for ETSI ITS messages";
  };
})

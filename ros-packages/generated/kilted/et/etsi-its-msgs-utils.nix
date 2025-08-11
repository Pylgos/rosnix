{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  etsi-its-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_msgs_utils";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_msgs_utils";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-msgs geometry-msgs tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "geographiclib" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-msgs geometry-msgs tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_msgs_utils" = substituteSource {
      src = fetchgit {
        name = "etsi_its_msgs_utils-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "1170305bd2b60300966209a41774a8d44b12b79d";
        hash = "sha256-MgOZnuI8GGUhS31dfPt7wXvHci3nj6wx785wf3nh6BA=";
      };
    };
  });
  meta = {
    description = "ROS messages and utility functions for ETSI ITS messages";
  };
})

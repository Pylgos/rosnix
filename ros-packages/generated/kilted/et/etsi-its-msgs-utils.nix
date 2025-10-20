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
  version = "3.4.0-1";
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
        rev = "387bae8a76e9ac45462fb293b767c4f4b329e09c";
        hash = "sha256-H+X6tJVdmW0UBT8Y5uYCxgZRGQF/KAKlgWfowM5imJg=";
      };
    };
  });
  meta = {
    description = "ROS messages and utility functions for ETSI ITS messages";
  };
})

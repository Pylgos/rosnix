{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  polygon-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "polygon_utils";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."polygon_utils";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ geometry-msgs polygon-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-shapely" ]; };
  checkInputs = [ ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "polygon_utils" = substituteSource {
      src = fetchgit {
        name = "polygon_utils-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "77ba03a92112d14903afe0c695d915d5d0cd4f5f";
        hash = "sha256-jxJnYlLoRV2btVaeRFkO5BtB1QGkYtymNWjYC0ZV7mI=";
      };
    };
  });
  meta = {
    description = "Utilities for working with polygons, including triangulation";
  };
})

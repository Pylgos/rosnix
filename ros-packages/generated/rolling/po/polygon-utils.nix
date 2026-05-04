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
  version = "1.3.0-2";
  src = finalAttrs.passthru.sources."polygon_utils";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ geometry-msgs polygon-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-shapely" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ geometry-msgs polygon-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-shapely" ]; };
  checkInputs = [ ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "polygon_utils" = substituteSource {
      src = fetchgit {
        name = "polygon_utils-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "a20237f2657d90b8cf71a2882219074bfbf5115a";
        hash = "sha256-stcqm+t6vTjM77+fbga9/4Vfv1Ikvd7RZojSVR2RfgA=";
      };
    };
  });
  meta = {
    description = "Utilities for working with polygons, including triangulation";
  };
})

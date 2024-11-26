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
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."polygon_utils";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ geometry-msgs polygon-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-shapely" ]; };
  checkInputs = [ ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "polygon_utils" = substituteSource {
      src = fetchgit {
        name = "polygon_utils-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "32a840fb29275dcf540d8b14c28997d06756c144";
        hash = "sha256-Tt1eWbIDyhUfE+Cfkub8TW8XBNp+ilTdRYr4lfSa5A8=";
      };
    };
  });
  meta = {
    description = "Utilities for working with polygons, including triangulation";
  };
})

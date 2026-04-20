{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  compressed-depth-image-transport,
  compressed-image-transport,
  depth-image-proc,
  fetchgit,
  fetchurl,
  fetchzip,
  image-proc,
  image-transport,
  laser-filters,
  mkSourceSet,
  raph-description,
  raph-interfaces,
  raph-oak,
  rosSystemPackages,
  rosapi,
  rosbridge-server,
  rplidar-ros,
  substituteSource,
  web-video-server,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raph_bringup";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."raph_bringup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ compressed-depth-image-transport compressed-image-transport depth-image-proc image-proc image-transport laser-filters raph-description raph-interfaces raph-oak rosapi rosbridge-server rplidar-ros web-video-server ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ compressed-depth-image-transport compressed-image-transport depth-image-proc image-proc image-transport laser-filters raph-description raph-interfaces raph-oak rosapi rosbridge-server rplidar-ros web-video-server ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "raph_bringup" = substituteSource {
      src = fetchgit {
        name = "raph_bringup-source";
        url = "https://github.com/ros2-gbp/raph_robot-release.git";
        rev = "6b967d817b209891d45ee8378e5715181e81a5ac";
        hash = "sha256-BU167EL6/t096r34Jerh0nMnYrqq1948FOJUr2NG+co=";
      };
    };
  });
  meta = {
    description = "\n    Scripts and launch files for starting basic Raph Rover functionalities.\n  ";
  };
})

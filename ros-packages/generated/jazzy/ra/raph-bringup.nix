{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  compressed-depth-image-transport,
  compressed-image-transport,
  depth-image-proc,
  depthai-ros-driver,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  laser-filters,
  mkSourceSet,
  raph-description,
  raph-interfaces,
  rosSystemPackages,
  rosapi,
  rosbridge-server,
  rplidar-ros,
  substituteSource,
  web-video-server,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raph_bringup";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."raph_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ compressed-depth-image-transport compressed-image-transport depth-image-proc depthai-ros-driver image-transport laser-filters raph-description raph-interfaces rosapi rosbridge-server rplidar-ros web-video-server ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ compressed-depth-image-transport compressed-image-transport depth-image-proc depthai-ros-driver image-transport laser-filters raph-description raph-interfaces rosapi rosbridge-server rplidar-ros web-video-server ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "raph_bringup" = substituteSource {
      src = fetchgit {
        name = "raph_bringup-source";
        url = "https://github.com/ros2-gbp/raph_robot-release.git";
        rev = "ac2ff033271bd69a61043a549c1c32f7d18b2f8f";
        hash = "sha256-KQ8UU5Ac6cvuLIhb9MiOtjKTqx4pNQqDD7RmCsax/Vo=";
      };
    };
  });
  meta = {
    description = "\n    Scripts and launch files for starting basic Raph Rover functionalities. \n  ";
  };
})

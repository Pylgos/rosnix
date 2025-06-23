{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  turtlebot3-applications-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_panorama";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."turtlebot3_panorama";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs image-transport nav-msgs rclcpp sensor-msgs turtlebot3-applications-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-system-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs image-transport nav-msgs rclcpp sensor-msgs turtlebot3-applications-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_panorama" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_panorama-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "97669b298d2e6bf5cd86f2e55af2a5d6750a9081";
        hash = "sha256-zgXF8sU7KufdhhCLqCnZ0ozDymfVUYkMhC1BxKg4OUQ=";
      };
    };
  });
  meta = {
    description = "\n	  Package for turtlebot3 panorama.\n  ";
  };
})

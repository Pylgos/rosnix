{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  aruco,
  aruco-msgs,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-transport,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "aruco_ros";
  version = "5.0.5-1";
  src = finalAttrs.passthru.sources."aruco_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ aruco aruco-msgs cv-bridge geometry-msgs image-transport rclcpp sensor-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ aruco aruco-msgs cv-bridge geometry-msgs image-transport rclcpp sensor-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "aruco_ros" = substituteSource {
      src = fetchgit {
        name = "aruco_ros-source";
        url = "https://github.com/ros2-gbp/aruco_ros-release.git";
        rev = "07d2d907f4813678461bd2e3a9feb45682e7c975";
        hash = "sha256-LIF5MiASkw9eXs5hNg5L1VAmICC588FpCYYSOHAjZjU=";
      };
    };
  });
  meta = {
    description = "\n    The ARUCO Library has been developed by the Ava group of the Univeristy of Cordoba(Spain).\n    It provides real-time marker based 3D pose estimation using AR markers.\n  ";
  };
})

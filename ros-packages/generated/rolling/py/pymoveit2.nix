{
  action-msgs,
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  moveit-msgs,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  shape-msgs,
  std-srvs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pymoveit2";
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."pymoveit2";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ action-msgs control-msgs geometry-msgs moveit-msgs rclpy sensor-msgs shape-msgs std-srvs trajectory-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ action-msgs control-msgs geometry-msgs moveit-msgs rclpy sensor-msgs shape-msgs std-srvs trajectory-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "pymoveit2" = substituteSource {
      src = fetchgit {
        name = "pymoveit2-source";
        url = "https://github.com/ros2-gbp/pymoveit2-release.git";
        rev = "04124a856864fd3e34f9c1bcf5a738caf42d80b3";
        hash = "sha256-ZtmWBQsCKcX0q53xMIFh8UbxF8e2Wzg6EWW74/gY9rQ=";
      };
    };
  });
  meta = {
    description = "Basic Python interface for MoveIt 2 built on top of ROS 2 actions and services";
  };
})

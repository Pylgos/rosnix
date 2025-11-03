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
  version = "4.2.0-1";
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
        rev = "8680f4045ae7b1e612549285a842b6eb056f3415";
        hash = "sha256-hsRa2RK7Y11GIn3FOyxqn6MQaM1x4ML/BjaxYRZKIKM=";
      };
    };
  });
  meta = {
    description = "Basic Python interface for MoveIt 2 built on top of ROS 2 actions and services";
  };
})

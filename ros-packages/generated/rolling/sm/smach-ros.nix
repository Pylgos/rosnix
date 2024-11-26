{
  ament-cmake,
  ament-cmake-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  smach,
  smach-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "smach_ros";
  version = "3.0.3-2";
  src = finalAttrs.passthru.sources."smach_ros";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ rclpy smach smach-msgs std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "smach_ros" = substituteSource {
      src = fetchgit {
        name = "smach_ros-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "23d7dc669c66f97f9721a03605f9f06e079b6b15";
        hash = "sha256-T0yVHzrZV1N2ejjOTANcS1gUlVKrvGgoMD+On5KNoHo=";
      };
    };
  });
  meta = {
    description = "The smach_ros package contains extensions for the SMACH library to integrate it tightly with ROS. For example, SMACH-ROS can call ROS services, listen to ROS topics, and integrate with";
  };
})

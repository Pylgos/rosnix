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
  version = "3.0.3-3";
  src = finalAttrs.passthru.sources."smach_ros";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ rclpy smach smach-msgs std-msgs std-srvs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ rclpy smach smach-msgs std-msgs std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "smach_ros" = substituteSource {
      src = fetchgit {
        name = "smach_ros-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "d16b3bef96ff7b3cac35e8f8ec771f6503498842";
        hash = "sha256-T0yVHzrZV1N2ejjOTANcS1gUlVKrvGgoMD+On5KNoHo=";
      };
    };
  });
  meta = {
    description = "\n    The smach_ros package contains extensions for the SMACH library to\n    integrate it tightly with ROS.  For example, SMACH-ROS can call\n    ROS services, listen to ROS topics, and integrate\n    with ";
  };
})

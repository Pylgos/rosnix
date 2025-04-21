{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator_teleop";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."open_manipulator_teleop";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclpy ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_teleop" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_teleop-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "c7a8981cc387d24d98d9cf609156baf4a512cd83";
        hash = "sha256-pQylwqpek9NCsKiNoNy02a8fQnn+Kp+sRhJNu8gHgOc=";
      };
    };
  });
  meta = {
    description = "OpenMANIPULATOR teleop ROS 2 package.";
  };
})

{
  ament-cmake,
  buildAmentCmakePackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-ros-planning-interface,
  rclcpp,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  trajectory-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator_playground";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."open_manipulator_playground";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ control-msgs moveit-ros-planning-interface rclcpp rclpy sensor-msgs trajectory-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_playground" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_playground-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "4ae43d689fadc2f63822a3333594876419786ce8";
        hash = "sha256-onW9rjr5SMQzp0Lo6wQR6PR7UBYNApLxbpGSRGw1XP8=";
      };
    };
  });
  meta = {
    description = "This package provides an example for utilizing the MoveIt API with the OpenMANIPULATOR-X, allowing users to practice and experiment freely.";
  };
})

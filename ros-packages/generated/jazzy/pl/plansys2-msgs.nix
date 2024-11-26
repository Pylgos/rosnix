{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "plansys2_msgs";
  version = "2.0.14-1";
  src = finalAttrs.passthru.sources."plansys2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rclcpp std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "plansys2_msgs" = substituteSource {
        src = fetchgit {
          name = "plansys2_msgs-source";
          url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
          rev = "12c2125fc82c42759a92f611f52ab90f34b1b58c";
          hash = "sha256-3G7wV4V4YYUnGr/mM4TeGZw89vd0ZYsihnX6uDYbJe8=";
        };
      };
    });
  };
  meta = {
    description = "Messages and service files for the ROS2 Planning System";
  };
})

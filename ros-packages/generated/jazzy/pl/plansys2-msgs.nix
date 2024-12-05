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
  version = "2.0.15-1";
  src = finalAttrs.passthru.sources."plansys2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rclcpp std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_msgs" = substituteSource {
      src = fetchgit {
        name = "plansys2_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "118c051e0e59683551d6afc5e1a4b2206694033d";
        hash = "sha256-kQ9eFV/P0AWmmKBYeeahl/UJlZzNWNjrG3MJwMxpMmU=";
      };
    };
  });
  meta = {
    description = "Messages and service files for the ROS2 Planning System";
  };
})

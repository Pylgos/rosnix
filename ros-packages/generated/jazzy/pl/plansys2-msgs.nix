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
  version = "2.0.18-1";
  src = finalAttrs.passthru.sources."plansys2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rclcpp rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rclcpp rosidl-default-generators std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "plansys2_msgs" = substituteSource {
      src = fetchgit {
        name = "plansys2_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "df8f4361e9f7e49f30e57ad8eedd5a8b702fc83c";
        hash = "sha256-HraM1ops+qppA1TZL3psD/DBCcgZVQBDtlgCgzYVb0o=";
      };
    };
  });
  meta = {
    description = "Messages and service files for the ROS2 Planning System";
  };
})

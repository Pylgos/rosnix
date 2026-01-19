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
  version = "3.0.2-1";
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
        rev = "fc2b813003c30f910eb9b94d491ec008ca6ff0e5";
        hash = "sha256-bnyp2TRaQ+NVKAX6QeMvosB3LxlyENgYf2U4MXz6fek=";
      };
    };
  });
  meta = {
    description = "Messages and service files for the ROS2 Planning System";
  };
})

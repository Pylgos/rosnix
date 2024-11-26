{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_msgs";
  version = "3.8.0-1";
  src = finalAttrs.passthru.sources."gazebo_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs trajectory-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_msgs" = substituteSource {
      src = fetchgit {
        name = "gazebo_msgs-source";
        url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release.git";
        rev = "a376d73c2086fdfe468d6ad4b6a6464797a6588b";
        hash = "sha256-sTnxrWA90gEXxma5YwKDCuk5gkRgjnFuZK9xRQes9cQ=";
      };
    };
  });
  meta = {
    description = "Message and service data structures for interacting with Gazebo from ROS2.";
  };
})

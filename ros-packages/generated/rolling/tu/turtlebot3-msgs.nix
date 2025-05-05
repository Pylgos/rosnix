{
  action-msgs,
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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_msgs";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."turtlebot3_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_msgs" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_msgs-source";
        url = "https://github.com/ros2-gbp/turtlebot3_msgs-release.git";
        rev = "6719abd607d69007d2b924c3863548b379209e53";
        hash = "sha256-IE7h9uyMsIkw++qbMiN7qKkzgrp8gZmRLH0y+9T0fLU=";
      };
    };
  });
  meta = {
    description = "Message and service types: custom messages and services for TurtleBot3 packages for ROS 2";
  };
})

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
  rcl-interfaces,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_interfaces";
  version = "1.0.7-1";
  src = finalAttrs.passthru.sources."ros_gz_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rcl-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_interfaces" = substituteSource {
      src = fetchgit {
        name = "ros_gz_interfaces-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "bac6f27b4bc9c64d44b7981268058c22b19d2549";
        hash = "sha256-wLAHCTj6BifL1UW1B5LYxc7847Ot0P7abZpt0RXMxVA=";
      };
    };
  });
  meta = {
    description = "Message and service data structures for interacting with Gazebo from ROS2.";
  };
})

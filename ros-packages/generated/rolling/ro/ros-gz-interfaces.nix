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
  version = "2.1.5-1";
  src = finalAttrs.passthru.sources."ros_gz_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rcl-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_interfaces" = substituteSource {
      src = fetchgit {
        name = "ros_gz_interfaces-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "5fdf31617d3a65a20a20e0586faf0f9b5fc140c6";
        hash = "sha256-96nfsqVQn2fjzwdM2Hb0O2W1xzKziCnC4z46U3FRaJQ=";
      };
    };
  });
  meta = {
    description = "Message and service data structures for interacting with Gazebo from ROS2.";
  };
})

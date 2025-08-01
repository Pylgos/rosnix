{
  ament-cmake,
  ament-lint-auto,
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
  pname = "cartographer_ros_msgs";
  version = "2.0.9003-2";
  src = finalAttrs.passthru.sources."cartographer_ros_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cartographer_ros_msgs" = substituteSource {
      src = fetchgit {
        name = "cartographer_ros_msgs-source";
        url = "https://github.com/ros2-gbp/cartographer_ros-release.git";
        rev = "6dbbf8f0f9ce1f40c12baa6089f52549ac3e489c";
        hash = "sha256-POmR42dN/mrsnISU7egd4dQ/y+W+VWvPUwQK+JlLCeU=";
      };
    };
  });
  meta = {
    description = "\n    ROS messages for the cartographer_ros package.\n  ";
  };
})

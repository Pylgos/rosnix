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
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."ros_gz_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rcl-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rcl-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_interfaces" = substituteSource {
      src = fetchgit {
        name = "ros_gz_interfaces-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "f668c922d63cef369f5bca92037cf6c71ccdb94a";
        hash = "sha256-9P6aPr+75QegMa/bLNeC60r8nwcqgDm8BY1xlNX3+4U=";
      };
    };
  });
  meta = {
    description = "Message and service data structures for interacting with Gazebo from ROS2.";
  };
})

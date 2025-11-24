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
  version = "2.1.12-1";
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
        rev = "f39d3f92877eff0db926702493e7784017a96fa4";
        hash = "sha256-PhZkqlPoLulOFqQ4lxJzGWfQF3nypG7nLdPOqs/KOZw=";
      };
    };
  });
  meta = {
    description = "Message and service data structures for interacting with Gazebo from ROS2.";
  };
})

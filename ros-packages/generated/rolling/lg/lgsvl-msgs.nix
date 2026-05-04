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
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lgsvl_msgs";
  version = "0.0.4-5";
  src = finalAttrs.passthru.sources."lgsvl_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs ros-environment rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs ros-environment rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lgsvl_msgs" = substituteSource {
      src = fetchgit {
        name = "lgsvl_msgs-source";
        url = "https://github.com/ros2-gbp/lgsvl_msgs-release.git";
        rev = "ef33e2fcbd5ef9809bc0788f877f6e3a0c827778";
        hash = "sha256-Pd5TP0wLuUr0/m+WvLpkvURpB0d0hbik3SOPkifg8YU=";
      };
    };
  });
  meta = {
    description = "Message definitions for interfacing with the LGSVL Simulator for ROS and ROS 2.";
  };
})

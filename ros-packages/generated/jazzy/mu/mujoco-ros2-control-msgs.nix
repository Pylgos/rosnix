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
  pname = "mujoco_ros2_control_msgs";
  version = "0.0.3-1";
  src = finalAttrs.passthru.sources."mujoco_ros2_control_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mujoco_ros2_control_msgs" = substituteSource {
      src = fetchgit {
        name = "mujoco_ros2_control_msgs-source";
        url = "https://github.com/ros2-gbp/mujoco_ros2_control-release.git";
        rev = "03a4a767b320862bdbef02ef845270de6593811d";
        hash = "sha256-58DLOD2Joqd9Tzs/e9sitcqPalDGmSSE1/7jroVFflQ=";
      };
    };
  });
  meta = {
    description = "msgs for mujoco_ros2_control package";
  };
})

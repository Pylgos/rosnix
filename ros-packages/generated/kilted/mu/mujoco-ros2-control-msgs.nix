{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mujoco_ros2_control_msgs";
  version = "0.0.2-1";
  src = finalAttrs.passthru.sources."mujoco_ros2_control_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mujoco_ros2_control_msgs" = substituteSource {
      src = fetchgit {
        name = "mujoco_ros2_control_msgs-source";
        url = "https://github.com/ros2-gbp/mujoco_ros2_control-release.git";
        rev = "e107e0cce85ca019700a788739e022fa4fa1709c";
        hash = "sha256-Mgn69nwE3XRtuVFxejb4KjH9QTChy5yhAlPEdafn4g0=";
      };
    };
  });
  meta = {
    description = "msgs for mujoco_ros2_control package";
  };
})

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
  version = "0.0.1-1";
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
        rev = "054f5a1b57d8a0343003a64d3e31e814608f6cd4";
        hash = "sha256-B4QsgRvJsjs8QeaW7D05Si8iAg4sSKkhqX7/+0diubI=";
      };
    };
  });
  meta = {
    description = "msgs for mujoco_ros2_control package";
  };
})

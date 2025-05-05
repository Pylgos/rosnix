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
  pname = "irobot_create_msgs";
  version = "3.0.0-2";
  src = finalAttrs.passthru.sources."irobot_create_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_msgs" = substituteSource {
      src = fetchgit {
        name = "irobot_create_msgs-source";
        url = "https://github.com/ros2-gbp/irobot_create_msgs-release.git";
        rev = "d6ad51b50f113a00229ac22ef07831ed3d086002";
        hash = "sha256-N1qIlklUPDvElU+dpUZJGeSzsiBeFmgh0kyqT+KM2fs=";
      };
    };
  });
  meta = {
    description = "Package containing action, message, and service definitions used by the iRobot(R) Create(R) platform";
  };
})

{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  object-recognition-msgs,
  octomap-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  shape-msgs,
  std-msgs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_msgs";
  version = "2.6.0-2";
  src = finalAttrs.passthru.sources."moveit_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs geometry-msgs object-recognition-msgs octomap-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs shape-msgs std-msgs trajectory-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs geometry-msgs object-recognition-msgs octomap-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs shape-msgs std-msgs trajectory-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_msgs" = substituteSource {
      src = fetchgit {
        name = "moveit_msgs-source";
        url = "https://github.com/ros2-gbp/moveit_msgs-release.git";
        rev = "0f41a913bc9d8a0f8272bf777916538f027752b3";
        hash = "sha256-eWWWhKKdKRwr1U0N2bGllNmgC2EzT0l5DNKFFjjXAYI=";
      };
    };
  });
  meta = {
    description = "Messages, services and actions used by MoveIt";
  };
})

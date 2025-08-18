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
  version = "2.7.1-1";
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
        rev = "b03fc38269a6735d1418d1df07a56a4d83c3f412";
        hash = "sha256-LEurAkzbvp8tc194UoDBTRKDYYySPySIcwepCn2mpII=";
      };
    };
  });
  meta = {
    description = "Messages, services and actions used by MoveIt";
  };
})

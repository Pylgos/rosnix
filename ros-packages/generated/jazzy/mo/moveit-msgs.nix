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
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."moveit_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs geometry-msgs object-recognition-msgs octomap-msgs rosidl-default-runtime sensor-msgs shape-msgs std-msgs trajectory-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_msgs" = substituteSource {
      src = fetchgit {
        name = "moveit_msgs-source";
        url = "https://github.com/ros2-gbp/moveit_msgs-release.git";
        rev = "1225bd68c7aaae83a9d763303e0b2ac909b3062a";
        hash = "sha256-xpAnqhbeUYf85S2GbiQw9gxJsrS6zLTPMNFaUetjRtY=";
      };
    };
  });
  meta = {
    description = "Messages, services and actions used by MoveIt";
  };
})

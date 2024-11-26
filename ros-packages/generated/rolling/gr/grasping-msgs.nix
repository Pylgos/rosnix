{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  moveit-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  shape-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grasping_msgs";
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."grasping_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs moveit-msgs rosidl-default-runtime sensor-msgs shape-msgs std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "grasping_msgs" = substituteSource {
        src = fetchgit {
          name = "grasping_msgs-source";
          url = "https://github.com/ros2-gbp/grasping_msgs-release.git";
          rev = "d7c3df936482d108abcd8e659408843589bd80d7";
          hash = "sha256-e/QiiwnuHIrC5x8sGMNrSSN6DseBR27gPzgQxpLo4cs=";
        };
      };
    });
  };
  meta = {
    description = "Messages for describing objects and how to grasp them.";
  };
})

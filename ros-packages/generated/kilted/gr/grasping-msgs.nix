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
  version = "0.5.0-2";
  src = finalAttrs.passthru.sources."grasping_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs moveit-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs shape-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs moveit-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs shape-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "grasping_msgs" = substituteSource {
      src = fetchgit {
        name = "grasping_msgs-source";
        url = "https://github.com/ros2-gbp/grasping_msgs-release.git";
        rev = "40529625a1e8461ec5ec59d09d1df8af87653ae9";
        hash = "sha256-e/QiiwnuHIrC5x8sGMNrSSN6DseBR27gPzgQxpLo4cs=";
      };
    };
  });
  meta = {
    description = "\n    Messages for describing objects and how to grasp them.\n  ";
  };
})

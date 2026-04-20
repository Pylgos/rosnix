{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kinematic_pose_msgs";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kinematic_pose_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "kinematic_pose_msgs" = substituteSource {
      src = fetchgit {
        name = "kinematic_pose_msgs-source";
        url = "https://github.com/ros2-gbp/kinematic_pose_msgs-release.git";
        rev = "42efb1d61e11afc733741c261dd601ebe3313abb";
        hash = "sha256-jvEI99/OeY5PxU/cmCPs7Ry4wZwGmTRqJPJJLMmLgDM=";
      };
    };
  });
  meta = {
    description = "A package containing the Kinematic Pose message, for dynamic pose tracking.";
  };
})

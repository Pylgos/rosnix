{
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "microstrain_inertial_msgs";
  version = "4.7.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_msgs" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_msgs-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "6a3d41dda9ecaaeb3cc1f4643b3f0fe77ba56a15";
        hash = "sha256-F1b+dDc+M1lJpff+mYGvDhtPCVuSbpdiIx4MbPRBLek=";
      };
    };
  });
  meta = {
    description = "A package that contains ROS message corresponding to microstrain message types.";
  };
})

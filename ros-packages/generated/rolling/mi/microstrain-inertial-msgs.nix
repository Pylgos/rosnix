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
  version = "4.6.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_msgs" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_msgs-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "ef105750afb88e3fcfa4a40d0c8324eaecbead47";
        hash = "sha256-UB/5DcSjTyoZfLsQ7Nrlw3qN3hba9498gyWPnrOjmNk=";
      };
    };
  });
  meta = {
    description = "A package that contains ROS message corresponding to microstrain message types.";
  };
})

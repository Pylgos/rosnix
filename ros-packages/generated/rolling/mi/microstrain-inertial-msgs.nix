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
  version = "4.8.0-2";
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
        rev = "940f6e111d3ca5cb8f5119f799160f85d932fa19";
        hash = "sha256-cFg0GIQiJGuZZ9rdMbUiLgZeqs6LY/D2V/6LUzCTLzg=";
      };
    };
  });
  meta = {
    description = "A package that contains ROS message corresponding to microstrain message types.";
  };
})

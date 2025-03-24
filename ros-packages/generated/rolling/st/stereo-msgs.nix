{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "stereo_msgs";
  version = "5.5.0-1";
  src = finalAttrs.passthru.sources."stereo_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "stereo_msgs" = substituteSource {
      src = fetchgit {
        name = "stereo_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "926bb454d12975d03ac062d450c4d43b1cd15f3d";
        hash = "sha256-1QkoQ2CM6aRhNgIR+LPS0imn/c6ye7N9YbLoc2dqxNM=";
      };
    };
  });
  meta = {
    description = "A package containing some stereo camera related message definitions.";
  };
})

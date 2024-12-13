{
  ament-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "foxglove_msgs";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."foxglove_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime visualization-msgs ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "foxglove_msgs" = substituteSource {
      src = fetchgit {
        name = "foxglove_msgs-source";
        url = "https://github.com/ros2-gbp/ros_foxglove_msgs-release.git";
        rev = "c11dba4c377ccf9c806bd19856b8e7afed8b0a91";
        hash = "sha256-0cnAco17UlpUEPGPBu4+OIM1Mu5K04WffPBWz1ZNTQQ=";
      };
    };
  });
  meta = {
    description = "foxglove_msgs provides visualization messages that are supported by Foxglove.";
  };
})

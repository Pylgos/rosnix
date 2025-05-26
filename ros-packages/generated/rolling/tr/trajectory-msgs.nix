{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "trajectory_msgs";
  version = "5.7.0-1";
  src = finalAttrs.passthru.sources."trajectory_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "trajectory_msgs" = substituteSource {
      src = fetchgit {
        name = "trajectory_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "aabb5fca64316ce00a1c7ddf4696d971f1871743";
        hash = "sha256-/YsVAV5aqONEE7QoFnMwgdvZfXJrcX8IojiOE4XBUrc=";
      };
    };
  });
  meta = {
    description = "A package containing some robot trajectory message definitions.";
  };
})

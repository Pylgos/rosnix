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
  version = "5.4.2-1";
  src = finalAttrs.passthru.sources."trajectory_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "trajectory_msgs" = substituteSource {
        src = fetchgit {
          name = "trajectory_msgs-source";
          url = "https://github.com/ros2-gbp/common_interfaces-release.git";
          rev = "a62a85031d57e21e0753d1b553f71b0d0be87586";
          hash = "sha256-c7BjDF64r/B0yGhMugbwMoo7XecV/UP+hz5O1wX+yoc=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some robot trajectory message definitions.";
  };
})

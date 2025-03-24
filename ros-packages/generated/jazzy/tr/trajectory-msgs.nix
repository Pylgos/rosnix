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
  version = "5.3.6-1";
  src = finalAttrs.passthru.sources."trajectory_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "trajectory_msgs" = substituteSource {
      src = fetchgit {
        name = "trajectory_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "320c41bc17c51287b1b82313bedb775633258daa";
        hash = "sha256-cdUfaWSIjOCvnZukOVmcdKy85eetRn4gIT+AkAdDrkQ=";
      };
    };
  });
  meta = {
    description = "A package containing some robot trajectory message definitions.";
  };
})

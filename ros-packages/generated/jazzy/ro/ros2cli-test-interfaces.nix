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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2cli_test_interfaces";
  version = "0.32.2-1";
  src = finalAttrs.passthru.sources."ros2cli_test_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2cli_test_interfaces" = substituteSource {
      src = fetchgit {
        name = "ros2cli_test_interfaces-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "142e2149eb573a018a352ca4e7e871ffd9a0faad";
        hash = "sha256-FPky13I2IFNe/Zq13Nu8kBbMVprErC5ZKT540dQmfjs=";
      };
    };
  });
  meta = {
    description = "A package containing interface definitions for testing ros2cli.";
  };
})

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
  version = "0.39.0-1";
  src = finalAttrs.passthru.sources."ros2cli_test_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2cli_test_interfaces" = substituteSource {
      src = fetchgit {
        name = "ros2cli_test_interfaces-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "001308b5c07be7b98cd48b9b404bf73690c9fefd";
        hash = "sha256-3PgrjLASg+eoJ3rnUoJ2GsB21fnFoueqjVmUYvTrxbs=";
      };
    };
  });
  meta = {
    description = "A package containing interface definitions for testing ros2cli.";
  };
})

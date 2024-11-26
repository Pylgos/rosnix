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
  version = "0.32.1-1";
  src = finalAttrs.passthru.sources."ros2cli_test_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2cli_test_interfaces" = substituteSource {
        src = fetchgit {
          name = "ros2cli_test_interfaces-source";
          url = "https://github.com/ros2-gbp/ros2cli-release.git";
          rev = "b1bf6454355b950121990d46c76a3d882a85c461";
          hash = "sha256-IpL1SqU83kbinY4QSBMYJ9v8CmLnWQdwkLedTylh3ZI=";
        };
      };
    });
  };
  meta = {
    description = "A package containing interface definitions for testing ros2cli.";
  };
})

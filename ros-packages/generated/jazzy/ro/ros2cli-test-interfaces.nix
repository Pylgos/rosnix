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
  version = "0.32.5-1";
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
        rev = "4936ad1e675ab47d6efdb61563e7275f5206ad7b";
        hash = "sha256-zP8p8k9oqvuwnWkteczmVt0PmUPZUoGvSAqKM9HPqG0=";
      };
    };
  });
  meta = {
    description = "A package containing interface definitions for testing ros2cli.";
  };
})

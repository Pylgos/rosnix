{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_control_test_assets";
  version = "4.23.0-1";
  src = finalAttrs.passthru.sources."ros2_control_test_assets";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_control_test_assets" = substituteSource {
      src = fetchgit {
        name = "ros2_control_test_assets-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "2f43e05d013d563e38503651ef3ca6f8b26b654e";
        hash = "sha256-gQmudvKEeYDYLFULeLlgvsRNKfsf9GX18kPPru2T3bs=";
      };
    };
  });
  meta = {
    description = "The package provides shared test resources for ros2_control stack";
  };
})

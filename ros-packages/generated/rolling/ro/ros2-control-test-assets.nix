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
  version = "4.20.0-1";
  src = finalAttrs.passthru.sources."ros2_control_test_assets";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_control_test_assets" = substituteSource {
      src = fetchgit {
        name = "ros2_control_test_assets-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "75267893c318eb77af68ae14e1960b9e62fe36dc";
        hash = "sha256-YeP0qsB9lRngHS4EBMEiHzBl04yobYrZVNId5EywmCc=";
      };
    };
  });
  meta = {
    description = "The package provides shared test resources for ros2_control stack";
  };
})

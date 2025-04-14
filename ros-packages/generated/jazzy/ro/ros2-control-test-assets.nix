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
  version = "4.28.0-1";
  src = finalAttrs.passthru.sources."ros2_control_test_assets";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_control_test_assets" = substituteSource {
      src = fetchgit {
        name = "ros2_control_test_assets-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "50df7d2a6ce8a335516e02e451bda8d1e832be51";
        hash = "sha256-q6eHjKJstkdtpNHAg7sxIyQMrdR5XVHy5U7l1IA6nwg=";
      };
    };
  });
  meta = {
    description = "Shared test resources for ros2_control stack";
  };
})

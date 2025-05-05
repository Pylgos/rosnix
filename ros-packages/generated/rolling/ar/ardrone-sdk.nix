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
  pname = "ardrone_sdk";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."ardrone_sdk";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "arsdk3" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "arsdk3" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ardrone_sdk" = substituteSource {
      src = fetchgit {
        name = "ardrone_sdk-source";
        url = "https://github.com/ros2-gbp/ardrone_ros-release.git";
        rev = "dd56f96cfe7966bd0ddfe790e89e976e654d57e2";
        hash = "sha256-IfL+QAZ1apfao2PSwgLcKWf1qei85KFKuO8ol4eJL68=";
      };
    };
  });
  meta = {
    description = "Exports ARSDK3 as a library";
  };
})

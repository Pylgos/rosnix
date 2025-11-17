{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-core,
  flexbe-input,
  flexbe-mirror,
  flexbe-msgs,
  flexbe-onboard,
  flexbe-states,
  flexbe-testing,
  flexbe-widget,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "flexbe_behavior_engine";
  version = "4.0.3-1";
  src = finalAttrs.passthru.sources."flexbe_behavior_engine";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ flexbe-core flexbe-input flexbe-mirror flexbe-msgs flexbe-onboard flexbe-states flexbe-testing flexbe-widget ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ flexbe-core flexbe-input flexbe-mirror flexbe-msgs flexbe-onboard flexbe-states flexbe-testing flexbe-widget ];
  passthru.sources = mkSourceSet (sources: {
    "flexbe_behavior_engine" = substituteSource {
      src = fetchgit {
        name = "flexbe_behavior_engine-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "97d0c5b2a11845f351fc5d8eb6753f47b0354c31";
        hash = "sha256-g3vuschDJNDYXC5l2YkHfxr2W+qE29+M6QVP4Cl9rIo=";
      };
    };
  });
  meta = {
    description = "\n    A meta-package to aggregate all the FlexBE packages\n  ";
  };
})

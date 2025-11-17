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
  version = "4.0.2-1";
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
        rev = "6f36ed1b31ab0d9c904732f5c41dabb7301bc355";
        hash = "sha256-l2KXoWXvwXG6KXungj3nAE1isWC8UjC24Wc7qat02CY=";
      };
    };
  });
  meta = {
    description = "\n    A meta-package to aggregate all the FlexBE packages\n  ";
  };
})

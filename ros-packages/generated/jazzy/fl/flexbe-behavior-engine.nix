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
  version = "3.0.7-1";
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
        rev = "f84b37f4581790c845d7a8d6a9c119879162f3b0";
        hash = "sha256-Qkcy/Cb9CvnAgaGLGQj9vcjqv0xv6gKE5edWEQTluL0=";
      };
    };
  });
  meta = {
    description = "\n    A meta-package to aggregate all the FlexBE packages\n  ";
  };
})

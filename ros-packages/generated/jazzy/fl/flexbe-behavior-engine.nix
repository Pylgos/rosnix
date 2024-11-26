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
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."flexbe_behavior_engine";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ flexbe-core flexbe-input flexbe-mirror flexbe-msgs flexbe-onboard flexbe-states flexbe-testing flexbe-widget ];
  passthru = {
    sources = mkSourceSet (sources: {
      "flexbe_behavior_engine" = substituteSource {
        src = fetchgit {
          name = "flexbe_behavior_engine-source";
          url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
          rev = "7bba4017945659d7c661bf76c3e165c9219678e4";
          hash = "sha256-l9yTnBvmIxQL5DNjo75+SegiknEw20p8+lO43JC6KaA=";
        };
      };
    });
  };
  meta = {
    description = "A meta-package to aggregate all the FlexBE packages";
  };
})

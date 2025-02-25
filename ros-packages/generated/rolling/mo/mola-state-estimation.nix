{
  ament-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-imu-preintegration,
  mola-state-estimation-simple,
  mola-state-estimation-smoother,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_state_estimation";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."mola_state_estimation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mola-imu-preintegration mola-state-estimation-simple mola-state-estimation-smoother ];
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "mola_state_estimation" = substituteSource {
      src = fetchgit {
        name = "mola_state_estimation-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "20dce4c117ba8caff2e2745e62aeef5d16a9c8b0";
        hash = "sha256-3ONi+tE9KCZVCT49rwC6QiWJh9fN9JimXjVGhYls9yo=";
      };
    };
  });
  meta = {
    description = "Metapackage with all MOLA state estimation packages.";
  };
})

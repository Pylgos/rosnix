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
  mola-state-estimation-simple,
  mola-state-estimation-smoother,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mola_state_estimation";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."mola_state_estimation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ mola-state-estimation-simple mola-state-estimation-smoother ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mola-state-estimation-simple mola-state-estimation-smoother ];
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ament-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "mola_state_estimation" = substituteSource {
      src = fetchgit {
        name = "mola_state_estimation-source";
        url = "https://github.com/ros2-gbp/mola_state_estimation-release.git";
        rev = "e78dc58f08260981a0b61d13a48779a260369959";
        hash = "sha256-4K0apBHAm5v6YJmyfmECVV5Wb5kTPYafu9Ya68WAL5k=";
      };
    };
  });
  meta = {
    description = "Metapackage with all MOLA state estimation packages.";
  };
})

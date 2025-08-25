{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ewellix-description,
  ewellix-interfaces,
  ewellix-moveit-config,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ewellix_lift_common";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."ewellix_lift_common";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ewellix-description ewellix-interfaces ewellix-moveit-config ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ewellix-description ewellix-interfaces ewellix-moveit-config ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ewellix_lift_common" = substituteSource {
      src = fetchgit {
        name = "ewellix_lift_common-source";
        url = "https://github.com/clearpath-gbp/ewellix_lift_common-release.git";
        rev = "302c97f638ea674af33bce4582f286f73cc17e04";
        hash = "sha256-SBXQirdgsICDrZFmtkRx4zSmILwDj2sbqSAlanxybfA=";
      };
    };
  });
  meta = {
    description = "Metapackage for common Ewellix lift packages";
  };
})

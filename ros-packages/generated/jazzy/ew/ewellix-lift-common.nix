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
  version = "0.2.1-2";
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
        rev = "7756bce40587a40065f0ea985dab4bc93a052d6d";
        hash = "sha256-Lz5SWBrvkX1bqsA7l8PWyt0DKjnQt0o53r/7TR4jilw=";
      };
    };
  });
  meta = {
    description = "Metapackage for common Ewellix lift packages";
  };
})

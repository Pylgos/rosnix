{
  ament-cmake,
  buildAmentCmakePackage,
  ewellix-description,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ewellix_viz";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."ewellix_viz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ewellix-description rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ewellix-description rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "ewellix_viz" = substituteSource {
      src = fetchgit {
        name = "ewellix_viz-source";
        url = "https://github.com/clearpath-gbp/ewellix_lift_common-release.git";
        rev = "ba06a9d6f79c3b3ddb3cd889a1600dff21280647";
        hash = "sha256-wYOacApBUPlWpFYY+P/OCu2aPNP1x+iMkVGVHkzff3c=";
      };
    };
  });
  meta = {
    description = "Clearpath's visualization package for Ewellix TLT lifting columns";
  };
})

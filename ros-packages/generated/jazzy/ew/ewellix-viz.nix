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
  version = "0.2.1-2";
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
        rev = "7979a8d8f397d3c7dacd9e2a98b6770551f4420c";
        hash = "sha256-VRRs9ekT/GCOtBPuOTABfl6SsGOfGu9RlxqskHThQPg=";
      };
    };
  });
  meta = {
    description = "Clearpath's visualization package for Ewellix TLT lifting columns";
  };
})

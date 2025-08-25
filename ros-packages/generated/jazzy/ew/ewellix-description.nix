{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ewellix_description";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."ewellix_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ewellix_description" = substituteSource {
      src = fetchgit {
        name = "ewellix_description-source";
        url = "https://github.com/clearpath-gbp/ewellix_lift_common-release.git";
        rev = "0318e8c677abf6b9e456fcd9fccbf2d629a70f03";
        hash = "sha256-7bA0Dfhh183YMPhSO2Sigmr3wqhEvUuiTu87cgnlHbs=";
      };
    };
  });
  meta = {
    description = "Clearpath's description package for Ewellix TLT lifting columns";
  };
})

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
  pname = "axis_description";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."axis_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "axis_description" = substituteSource {
      src = fetchgit {
        name = "axis_description-source";
        url = "https://github.com/clearpath-gbp/axis_camera-release.git";
        rev = "3207100f372595fd369764e804a25804aec87db2";
        hash = "sha256-U9CV11QUxiy/lv4tQhScpzmo9f0gymbQKyprQRNfYYE=";
      };
    };
  });
  meta = {
    description = "Description package with URDF files for common Axis fixed and PTZ cameras";
  };
})

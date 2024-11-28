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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."axis_description";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "axis_description" = substituteSource {
      src = fetchgit {
        name = "axis_description-source";
        url = "https://github.com/clearpath-gbp/axis_camera-release.git";
        rev = "f22b0bed8da1e4e47a7ac4a005069141cfb50fa4";
        hash = "sha256-fUnmltIc1EGZ2/Ixt96xyMAxa0gUw9a4/G1fJi1bRNg=";
      };
    };
  });
  meta = {
    description = "Description package with URDF files for common Axis fixed and PTZ cameras";
  };
})

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
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."axis_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "axis_description" = substituteSource {
      src = fetchgit {
        name = "axis_description-source";
        url = "https://github.com/clearpath-gbp/axis_camera-release.git";
        rev = "20e026b8701d78ec9729a6df05f1629e6f6f5ff3";
        hash = "sha256-OtqWA5iOH7MNjeqKUQBmTpb3/G1D6C+i9UYjrbOKmyc=";
      };
    };
  });
  meta = {
    description = "Description package with URDF files for common Axis fixed and PTZ cameras";
  };
})

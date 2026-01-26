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
  pname = "rmf_demos_assets";
  version = "2.8.1-2";
  src = finalAttrs.passthru.sources."rmf_demos_assets";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_assets" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_assets-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "7f9c3246a33d4ef9624425cd6e232eebba92f910";
        hash = "sha256-PUODmBsVOzW7JNleqk4b1ns0QYnrak9/P41bKx1JXBI=";
      };
    };
  });
  meta = {
    description = "Models and other media used for RMF demos";
  };
})

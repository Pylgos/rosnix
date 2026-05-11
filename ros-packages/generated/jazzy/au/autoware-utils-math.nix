{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_math";
  version = "1.7.2-1";
  src = finalAttrs.passthru.sources."autoware_utils_math";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_math" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_math-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "f52d3fca43514f14104c0ecfcc7c0e0c3254ff3c";
        hash = "sha256-7mRdh/RdPK8EI8GCjBsbjn5VdrG5PF5ebPE9/we6okE=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_math package";
  };
})

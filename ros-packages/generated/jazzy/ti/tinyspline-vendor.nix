{
  ament-cmake,
  ament-cmake-vendor-package,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tinyspline_vendor";
  version = "0.6.1-1";
  src = finalAttrs.passthru.sources."tinyspline_vendor";
  nativeBuildInputs = [ ament-cmake ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tinyspline_vendor" = substituteSource {
      src = fetchgit {
        name = "tinyspline_vendor-source";
        url = "https://github.com/ros2-gbp/tinyspline_vendor-release.git";
        rev = "a06565ed4aff7d2c19a4a058ea3f43323075b2ab";
        hash = "sha256-mQi06924EtNw7quRVGSQDJ2EFYqUCOsq37JO/eH/gJE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_TYPE git";
          to = "";
        }
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/msteinbeck/tinyspline.git";
          to = "VCS_TYPE path VCS_URL ${sources."tinyspline_vendor/tinyspline"}";
        }
      ];
    };
    "tinyspline_vendor/tinyspline" = substituteSource {
      src = fetchgit {
        name = "tinyspline-source";
        url = "https://github.com/msteinbeck/tinyspline.git";
        rev = "5f0e8fad34e86771cfae3dac4beef5f1858d5610";
        hash = "sha256-cvnnVT04R2QnFKsf/lxzkDmxgalAPFw8hGC33HyNsIQ=";
      };
    };
  });
  meta = {
    description = "The vendor package for tinyspline.";
  };
})

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
  pname = "autoware_adapi_specs";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_adapi_specs";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_adapi_specs" = substituteSource {
      src = fetchgit {
        name = "autoware_adapi_specs-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "ee6d2ccfcc06bf25d9c7090d20e080d06dffb451";
        hash = "sha256-3OapP7XkJExsU8oP3XaWe4Vfgc74F2saj6r9OISJPJw=";
      };
    };
  });
  meta = {
    description = "The autoware_adapi_specs package";
  };
})

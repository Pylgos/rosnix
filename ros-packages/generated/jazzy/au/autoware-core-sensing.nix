{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-vehicle-velocity-converter,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_core_sensing";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_core_sensing";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-vehicle-velocity-converter ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-vehicle-velocity-converter ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_core_sensing" = substituteSource {
      src = fetchgit {
        name = "autoware_core_sensing-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "bf1de1c8db112d6585cb1489563294f594f47374";
        hash = "sha256-R1OFprZMMw3BJ5EP8jGHWoE0MVyHWXE0kV8u7jDl2bs=";
      };
    };
  });
  meta = {
    description = "The autoware_core_sensing package";
  };
})

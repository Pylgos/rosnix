{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-utils-tf,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-conversions,
  pcl-ros,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_pcl";
  version = "1.7.2-1";
  src = finalAttrs.passthru.sources."autoware_utils_pcl";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-utils-tf pcl-conversions pcl-ros ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-utils-tf pcl-conversions pcl-ros ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_pcl" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_pcl-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "486bcce544d92455e6fee05d886389e52c8b733b";
        hash = "sha256-hkIHje2hMAwXQH3XtB5Cv4Dzm8KT4yicIuQt2YLycPM=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_pcl package";
  };
})

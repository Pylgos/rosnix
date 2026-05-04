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
  version = "1.4.2-3";
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
        rev = "0b3c03c2764acfae40ef864bd166617aafe2b7fd";
        hash = "sha256-MXfrE2a7mHQS1U/FCNK4JJFlBuYQwa3iQilfbv2fegM=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_pcl package";
  };
})

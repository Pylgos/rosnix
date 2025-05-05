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
  version = "1.4.0-1";
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
        rev = "c1745f65a5bfc8793354b37028a9ce13d6574844";
        hash = "sha256-Euy49RP5U6OAUgPqPYlh/atxzznEOq2GgRxFZhWbqqU=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_pcl package";
  };
})

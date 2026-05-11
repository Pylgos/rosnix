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
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_system";
  version = "1.7.2-1";
  src = finalAttrs.passthru.sources."autoware_utils_system";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_system" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_system-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "09a0cb3ee15cc686907f2ce32a8424614f8f78b6";
        hash = "sha256-ytUGpudtBpOouVRUBDuri4QAwT1+gzuWRsiSGscOR3w=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_system package";
  };
})

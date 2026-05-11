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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_rclcpp";
  version = "1.7.2-1";
  src = finalAttrs.passthru.sources."autoware_utils_rclcpp";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-lint-auto autoware-lint-common std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_rclcpp" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_rclcpp-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "e5c99dbb09fd89a045cc4e2f2744cb956c82955a";
        hash = "sha256-YryjmK2FjLB6sqGuokVHPYNQ4jLWOKVgCuhhrv2b/ic=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_rclcpp package";
  };
})

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
        rev = "e0d112b2f899f663cf25222b2f95ca0e100dde7f";
        hash = "sha256-YryjmK2FjLB6sqGuokVHPYNQ4jLWOKVgCuhhrv2b/ic=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_rclcpp package";
  };
})

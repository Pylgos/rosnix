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
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_visualization";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."autoware_utils_visualization";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ rclcpp visualization-msgs ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ rclcpp visualization-msgs ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_visualization" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_visualization-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "3056f2412172ac02dca9f844e81fac8069ec06c2";
        hash = "sha256-jZeRjXyNdy82CwEnP3zpwf4W/Z2kDuuz7uQegFmV3OE=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_visualization package";
  };
})

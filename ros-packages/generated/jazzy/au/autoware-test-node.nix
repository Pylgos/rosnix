{
  ament-cmake-auto,
  autoware-cmake,
  autoware-node,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_test_node";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_test_node";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-node rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-node rclcpp rclcpp-components ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_test_node" = substituteSource {
      src = fetchgit {
        name = "autoware_test_node-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "820fe0d22d3da4f367e4950fd4b57d6a9d2e23bd";
        hash = "sha256-Ga5Uxw8pkoTa1G3wJ/W4iXYVYzN7jPl1YG4ZcMu/coM=";
      };
    };
  });
  meta = {
    description = "Test package for Autoware Node.";
  };
})

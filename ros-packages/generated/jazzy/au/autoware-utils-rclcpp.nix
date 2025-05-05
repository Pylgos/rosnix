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
  version = "1.4.0-1";
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
        rev = "73ca43910928361621e1c4bbf2f727de64968191";
        hash = "sha256-ixJ3gNvF86vUEaMsROWsWHU5z1x071cSgMrXKeZF5pI=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_rclcpp package";
  };
})

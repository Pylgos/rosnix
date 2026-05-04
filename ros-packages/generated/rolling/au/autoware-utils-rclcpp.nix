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
  version = "1.4.2-3";
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
        rev = "58c46255ac70c1bf8829a923eaea0d111c09d455";
        hash = "sha256-X6H3KDvWvWfbsn4YKLbON8MNJLi3zBiGY+31F675Mac=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_rclcpp package";
  };
})

{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_diagnostics";
  version = "1.7.2-1";
  src = finalAttrs.passthru.sources."autoware_utils_diagnostics";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs diagnostic-updater rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater rclcpp ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_diagnostics" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_diagnostics-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "19da6e5d7cde89ec392b64942db2fa6beaee834a";
        hash = "sha256-0RLkHBinHAdqipDk3Pt5Lp7n3fG+AbxGZokr1opeko8=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_diagnostics package";
  };
})

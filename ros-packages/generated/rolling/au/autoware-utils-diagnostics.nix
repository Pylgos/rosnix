{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
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
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_utils_diagnostics";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs rclcpp ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_diagnostics" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_diagnostics-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "cfdb19262cf4105b69c474c9ad5f7f9dcab69e1d";
        hash = "sha256-l3Lsh+SYNlFI6ruOK8Ef7huMeRMnjTDKygas4NS7o5g=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_diagnostics package";
  };
})

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
  version = "1.4.1-1";
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
        rev = "1e3b4585cb161b276ee191dd74b14895a525173b";
        hash = "sha256-hCptIq8P6wWw6ihszLEby8AQ1aDwIYKo3D6O1lgirzM=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_diagnostics package";
  };
})

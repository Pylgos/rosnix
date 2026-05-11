{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-internal-msgs,
  autoware-lint-common,
  autoware-utils-system,
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
  pname = "autoware_utils_debug";
  version = "1.7.2-1";
  src = finalAttrs.passthru.sources."autoware_utils_debug";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-debug-msgs autoware-internal-msgs autoware-utils-system diagnostic-msgs rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-debug-msgs autoware-internal-msgs autoware-utils-system diagnostic-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_debug" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_debug-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "c1eea194893d5202693fb859e4d3b7db07f749a7";
        hash = "sha256-e1jEp0dV7dElW5vOZpP6vVT3/ZoNP9k/2ppVwl+0Nz0=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_debug package";
  };
})

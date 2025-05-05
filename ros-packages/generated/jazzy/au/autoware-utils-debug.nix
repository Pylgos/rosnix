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
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_utils_debug";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-debug-msgs autoware-internal-msgs autoware-utils-system diagnostic-msgs rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-debug-msgs autoware-internal-msgs autoware-utils-system diagnostic-msgs rclcpp ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_debug" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_debug-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "9f3380fa9fd807d788976a9034472f9eeb06ff03";
        hash = "sha256-NdANCprbK6a4VU12p6a7Hx2KFm+OqDEoppFQIUygWb4=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_debug package";
  };
})

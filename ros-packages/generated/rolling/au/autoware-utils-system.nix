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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_system";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."autoware_utils_system";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_system" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_system-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "36f214ce7031b756f9ba63eb04ef41ca6f766611";
        hash = "sha256-AMACaSMxnWZOu2OQ1NVJVO2yxh6OZDTELsud7By/zEA=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_system package";
  };
})

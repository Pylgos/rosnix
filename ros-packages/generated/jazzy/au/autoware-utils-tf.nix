{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-utils-geometry,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_tf";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."autoware_utils_tf";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-utils-geometry geometry-msgs rclcpp tf2-ros ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-utils-geometry geometry-msgs rclcpp tf2-ros ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_tf" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_tf-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "39b7f066b1fef2b0aa63bc19017ca65028e74dc3";
        hash = "sha256-DbUz89o86HqXffgdlMqj6/UARZm/BH6/i18+h0nVymU=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_tf package";
  };
})

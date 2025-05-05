{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  logging-demo,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_logging";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_utils_logging";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ logging-demo rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ logging-demo rclcpp ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_logging" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_logging-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "eb3c10c874aa2ab4d5c7680fb51865d3df4f1861";
        hash = "sha256-2wjFmE/2h5d899lV0HtRyDQTGURKkaWAii79+jrefBI=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_logging package";
  };
})

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
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_visualization";
  version = "1.7.2-1";
  src = finalAttrs.passthru.sources."autoware_utils_visualization";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ rclcpp visualization-msgs ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ rclcpp visualization-msgs ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_visualization" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_visualization-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "58885649f006cd9f8ea6d595b7ed2e5f1e392d43";
        hash = "sha256-Ce2iDwCFVf35uc8f9gMuT2hRprnBFSoE5UD95hbnYlQ=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_visualization package";
  };
})

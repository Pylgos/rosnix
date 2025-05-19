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
  version = "1.4.1-1";
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
        rev = "39293a56ae7532864de094c2d7b89067d93f1910";
        hash = "sha256-unROUqpuA244NH7a37xNT4/YChY85EtsyXD3O3EnUC4=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_visualization package";
  };
})

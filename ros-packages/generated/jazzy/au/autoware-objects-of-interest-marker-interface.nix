{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-perception-msgs,
  autoware-utils-geometry,
  autoware-utils-math,
  autoware-utils-visualization,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_objects_of_interest_marker_interface";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_objects_of_interest_marker_interface";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-perception-msgs autoware-utils-geometry autoware-utils-math autoware-utils-visualization geometry-msgs rclcpp std-msgs visualization-msgs ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-perception-msgs autoware-utils-geometry autoware-utils-math autoware-utils-visualization geometry-msgs rclcpp std-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_objects_of_interest_marker_interface" = substituteSource {
      src = fetchgit {
        name = "autoware_objects_of_interest_marker_interface-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "c2a0d85411306eff17cdbc6e290cac8a7c4fad10";
        hash = "sha256-Otzxp1QKSTb2ooEsTiiQ5zM1T5iuT+vUdEtyHG3eQ2I=";
      };
    };
  });
  meta = {
    description = "The autoware_objects_of_interest_marker_interface package";
  };
})

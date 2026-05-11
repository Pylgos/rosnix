{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lanelet2-extension,
  autoware-lanelet2-utils,
  autoware-lint-common,
  autoware-map-msgs,
  autoware-planning-msgs,
  autoware-pyplot,
  autoware-test-utils,
  autoware-trajectory,
  autoware-utils-geometry,
  autoware-utils-math,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_route_handler";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_route_handler";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-lanelet2-extension autoware-lanelet2-utils autoware-map-msgs autoware-planning-msgs autoware-trajectory autoware-utils-geometry autoware-utils-math geometry-msgs rclcpp rclcpp-components tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "yaml-cpp" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-lanelet2-extension autoware-lanelet2-utils autoware-map-msgs autoware-planning-msgs autoware-trajectory autoware-utils-geometry autoware-utils-math geometry-msgs rclcpp rclcpp-components tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common autoware-pyplot autoware-test-utils ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_route_handler" = substituteSource {
      src = fetchgit {
        name = "autoware_route_handler-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "7bced9aeef1d6399c900ccf523a76028058c4d08";
        hash = "sha256-BVl9GOqq6YBoUELf/uLFzs3CtKNfOBDfVCXjM0v5VjU=";
      };
    };
  });
  meta = {
    description = "The route_handling package";
  };
})

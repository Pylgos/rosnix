{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-adapi-v1-msgs,
  autoware-cmake,
  autoware-internal-planning-msgs,
  autoware-interpolation,
  autoware-lint-common,
  autoware-planning-msgs,
  autoware-utils-geometry,
  autoware-utils-math,
  autoware-utils-system,
  autoware-utils-visualization,
  autoware-vehicle-msgs,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_motion_utils";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_motion_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-adapi-v1-msgs autoware-internal-planning-msgs autoware-interpolation autoware-planning-msgs autoware-utils-geometry autoware-utils-math autoware-utils-system autoware-utils-visualization autoware-vehicle-msgs builtin-interfaces geometry-msgs rclcpp tf2 tf2-geometry-msgs visualization-msgs ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-adapi-v1-msgs autoware-internal-planning-msgs autoware-interpolation autoware-planning-msgs autoware-utils-geometry autoware-utils-math autoware-utils-system autoware-utils-visualization autoware-vehicle-msgs builtin-interfaces geometry-msgs rclcpp tf2 tf2-geometry-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_motion_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_motion_utils-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "83bb662f45adfdab76cc7746521209f92f6b3ec0";
        hash = "sha256-3WtKxovZRZTl2W9WWCfn2o7/RVY6mR/XlTg3eRGZi8A=";
      };
    };
  });
  meta = {
    description = "The autoware_motion_utils package";
  };
})

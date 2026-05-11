{
  ament-cmake-auto,
  ament-index-cpp,
  autoware-cmake,
  autoware-internal-planning-msgs,
  autoware-lanelet2-utils,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-planning-msgs,
  autoware-pyplot,
  autoware-test-utils,
  autoware-utils-geometry,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lanelet2-core,
  mkSourceSet,
  pybind11-vendor,
  python-cmake-module,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tl-expected,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_trajectory";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_trajectory";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake python-cmake-module ];
  propagatedNativeBuildInputs = [ autoware-internal-planning-msgs autoware-lanelet2-utils autoware-planning-msgs autoware-utils-geometry geometry-msgs lanelet2-core rclcpp tf2 tf2-geometry-msgs tl-expected ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake python-cmake-module ];
  propagatedBuildInputs = [ autoware-internal-planning-msgs autoware-lanelet2-utils autoware-planning-msgs autoware-utils-geometry geometry-msgs lanelet2-core rclcpp tf2 tf2-geometry-msgs tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-cmake-auto ament-index-cpp autoware-lint-common autoware-motion-utils autoware-pyplot autoware-test-utils autoware-utils-geometry pybind11-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dev" "python3-matplotlib" "range-v3" "yaml-cpp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "autoware_trajectory" = substituteSource {
      src = fetchgit {
        name = "autoware_trajectory-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "b1274e4a82c53ee0f3c05b6c092dd9084d1d327f";
        hash = "sha256-NowsGM7rLhpnUqgWUhyEUWOBzQ/FGiqjvIcQQdlyZzQ=";
      };
    };
  });
  meta = {
    description = "The autoware_trajectory package";
  };
})

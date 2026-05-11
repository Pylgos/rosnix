{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  autoware-adapi-v1-msgs,
  autoware-cmake,
  autoware-internal-planning-msgs,
  autoware-lanelet2-extension,
  autoware-lint-common,
  autoware-map-msgs,
  autoware-perception-msgs,
  autoware-planning-msgs,
  autoware-pyplot,
  autoware-utils-geometry,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-io,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2-msgs,
  tf2-ros,
  unique-identifier-msgs,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_test_utils";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_test_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp autoware-adapi-v1-msgs autoware-internal-planning-msgs autoware-lanelet2-extension autoware-map-msgs autoware-perception-msgs autoware-planning-msgs autoware-utils-geometry lanelet2-io nav-msgs rclcpp std-srvs tf2-msgs tf2-ros unique-identifier-msgs yaml-cpp-vendor ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ ament-index-cpp autoware-adapi-v1-msgs autoware-internal-planning-msgs autoware-lanelet2-extension autoware-map-msgs autoware-perception-msgs autoware-planning-msgs autoware-utils-geometry lanelet2-io nav-msgs rclcpp std-srvs tf2-msgs tf2-ros unique-identifier-msgs yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common autoware-pyplot ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_test_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_test_utils-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "59b08a9161e9e91d0defca0db4cbe934bb2262ab";
        hash = "sha256-7xGoEGzke2DHjogZG8BaFp210I6NdiTkwVK2dcHzxHE=";
      };
    };
  });
  meta = {
    description = "ROS 2 node for testing interface of the nodes in planning module";
  };
})

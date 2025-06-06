{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-debug-msgs,
  autoware-internal-msgs,
  autoware-internal-planning-msgs,
  autoware-lint-common,
  autoware-perception-msgs,
  autoware-planning-msgs,
  autoware-utils-debug,
  autoware-utils-diagnostics,
  autoware-utils-geometry,
  autoware-utils-logging,
  autoware-utils-math,
  autoware-utils-pcl,
  autoware-utils-rclcpp,
  autoware-utils-system,
  autoware-utils-tf,
  autoware-utils-uuid,
  autoware-utils-visualization,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."autoware_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-debug-msgs autoware-internal-msgs autoware-internal-planning-msgs autoware-perception-msgs autoware-planning-msgs autoware-utils-debug autoware-utils-diagnostics autoware-utils-geometry autoware-utils-logging autoware-utils-math autoware-utils-pcl autoware-utils-rclcpp autoware-utils-system autoware-utils-tf autoware-utils-uuid autoware-utils-visualization ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-debug-msgs autoware-internal-msgs autoware-internal-planning-msgs autoware-perception-msgs autoware-planning-msgs autoware-utils-debug autoware-utils-diagnostics autoware-utils-geometry autoware-utils-logging autoware-utils-math autoware-utils-pcl autoware-utils-rclcpp autoware-utils-system autoware-utils-tf autoware-utils-uuid autoware-utils-visualization ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_utils-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "39ce189d9e577c624092c468da4b571dfb99b655";
        hash = "sha256-84AKVwo72hUOBP3hOAml0kCH8t6zasPoelwIUXu1JQU=";
      };
    };
  });
  meta = {
    description = "The autoware_utils package";
  };
})

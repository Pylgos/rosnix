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
  version = "1.7.2-1";
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
        rev = "511efcf3f5a4dd26574ca29335f4f4a0b5aaa9b8";
        hash = "sha256-QGeaojoEeNTHlFPfoQ6ixKc7wL2vLd189sR1yrWcIO8=";
      };
    };
  });
  meta = {
    description = "The autoware_utils package";
  };
})

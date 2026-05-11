{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-planning-msgs,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-planning-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_planning_factor_interface";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_planning_factor_interface";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-planning-msgs autoware-motion-utils autoware-planning-msgs rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-planning-msgs autoware-motion-utils autoware-planning-msgs rclcpp ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_planning_factor_interface" = substituteSource {
      src = fetchgit {
        name = "autoware_planning_factor_interface-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "9afa6bbff72699ee53c5772acbc96d2ea1a7d8f3";
        hash = "sha256-JTPuLsqx0I8dikY7KcJhFr87OKxvD+H0S2cbh9eihM4=";
      };
    };
  });
  meta = {
    description = "The autoware_planning_factor_interface package";
  };
})

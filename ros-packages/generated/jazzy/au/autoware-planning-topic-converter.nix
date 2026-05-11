{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-planning-msgs,
  autoware-utils-geometry,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_planning_topic_converter";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_planning_topic_converter";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-motion-utils autoware-planning-msgs autoware-utils-geometry rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-motion-utils autoware-planning-msgs autoware-utils-geometry rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_planning_topic_converter" = substituteSource {
      src = fetchgit {
        name = "autoware_planning_topic_converter-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "2043e5ee22f034b6eb12d390d546693a6a3bde53";
        hash = "sha256-RLVYQwIhy+AGRnCZKin7uy/SqeBcFXFyuH5rz1tsd4w=";
      };
    };
  });
  meta = {
    description = "The autoware_planning_topic_converter package";
  };
})

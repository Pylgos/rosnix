{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pal-statistics-msgs,
  rclcpp,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cm_topic_hardware_component";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."cm_topic_hardware_component";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ hardware-interface pal-statistics-msgs rclcpp ros2-control-cmake ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ hardware-interface pal-statistics-msgs rclcpp ros2-control-cmake ];
  checkInputs = [ ament-cmake-gmock hardware-interface ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "cm_topic_hardware_component" = substituteSource {
      src = fetchgit {
        name = "cm_topic_hardware_component-source";
        url = "https://github.com/ros2-gbp/topic_based_hardware-release.git";
        rev = "2536a52f7ad48106b422f94a5fad95e8114da349";
        hash = "sha256-NLktP20xNBupu0UM8ALE6IhhbdXX2pkoHCyP1OT2n0Y=";
      };
    };
  });
  meta = {
    description = "ros2_control hardware component using pal_statistics messages from controller_manager introspection";
  };
})

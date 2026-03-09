{
  ament-cmake,
  ament-cmake-copyright,
  auto-apms-behavior-tree,
  auto-apms-interfaces,
  auto-apms-mission,
  auto-apms-ros2behavior,
  auto-apms-util,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "auto_apms_examples";
  version = "1.5.0-1";
  src = finalAttrs.passthru.sources."auto_apms_examples";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ auto-apms-behavior-tree auto-apms-interfaces auto-apms-mission auto-apms-ros2behavior auto-apms-util rclcpp-components ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ auto-apms-behavior-tree auto-apms-interfaces auto-apms-mission auto-apms-ros2behavior auto-apms-util rclcpp-components ];
  checkInputs = [ ament-cmake-copyright ];
  passthru.sources = mkSourceSet (sources: {
    "auto_apms_examples" = substituteSource {
      src = fetchgit {
        name = "auto_apms_examples-source";
        url = "https://github.com/ros2-gbp/autoapms-release.git";
        rev = "04bf55fe05012c7bc9f093cca3dea2b673a0b0ad";
        hash = "sha256-b9VcH0ZgV2prft3N1grddtdClBiSRpQ/Iojh0q+lrlM=";
      };
    };
  });
  meta = {
    description = "Examples package for AutoAPMS";
  };
})

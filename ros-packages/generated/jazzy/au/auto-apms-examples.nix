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
  version = "1.4.2-1";
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
        rev = "14b585828a85aaaaa6eb87cbe8982c6f3a14c96c";
        hash = "sha256-+xdew1vlPWmfOvThCcIvRNUvWkJwhsL+dJanfpPvPhA=";
      };
    };
  });
  meta = {
    description = "Examples package for AutoAPMS";
  };
})

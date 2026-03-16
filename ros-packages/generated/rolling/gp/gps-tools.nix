{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gps-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gps_tools";
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."gps_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ gps-msgs nav-msgs rclcpp rclcpp-components rclpy sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ gps-msgs nav-msgs rclcpp rclcpp-components rclpy sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "gps_tools" = substituteSource {
      src = fetchgit {
        name = "gps_tools-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "ee0d56e495cd8b79f926d2c1ee3479ae07d96858";
        hash = "sha256-KC90OQ7f+gefzp5FU/nfwPPQRIs374eY5flcykbAmrE=";
      };
    };
  });
  meta = {
    description = "GPS routines for use in GPS drivers";
  };
})

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
  version = "2.0.5-1";
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
        rev = "c08b1c139ce5fd6ecc4753d7ecbb7492b920d4b6";
        hash = "sha256-RLTZbNmLBGMY7bDXuLyGP4Ps1z9c+bups1ohjkB4We0=";
      };
    };
  });
  meta = {
    description = "GPS routines for use in GPS drivers";
  };
})

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
  version = "2.1.0-1";
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
        rev = "7de4ab2e1882df1917666096cb2aec313336764b";
        hash = "sha256-JV4Kx958GOBZ27dK5Ye1f24JDtCIUEoRALpVq8ZAeBI=";
      };
    };
  });
  meta = {
    description = "GPS routines for use in GPS drivers";
  };
})

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
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."gps_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ gps-msgs nav-msgs rclcpp rclcpp-components rclpy sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "gps_tools" = substituteSource {
      src = fetchgit {
        name = "gps_tools-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "5228a585b349d3bb513b58609d67142a2fd4c3b6";
        hash = "sha256-+bW839E0UolKzA4D0kkBoqHgk4d/WmPJZLONWM/hGV0=";
      };
    };
  });
  meta = {
    description = "GPS routines for use in GPS drivers";
  };
})

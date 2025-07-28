{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  mrpt-libnav,
  mrpt-libros-bridge,
  mrpt-nav-interfaces,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_reactivenav2d";
  version = "2.2.4-1";
  src = finalAttrs.passthru.sources."mrpt_reactivenav2d";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto geometry-msgs mrpt-libnav mrpt-libros-bridge mrpt-nav-interfaces nav-msgs rclcpp rclcpp-components sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto geometry-msgs mrpt-libnav mrpt-libros-bridge mrpt-nav-interfaces nav-msgs rclcpp rclcpp-components sensor-msgs std-msgs stereo-msgs tf2 tf2-geometry-msgs tf2-ros visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_reactivenav2d" = substituteSource {
      src = fetchgit {
        name = "mrpt_reactivenav2d-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "a3abf9d2022252b3397b6eb624bd743c16daa208";
        hash = "sha256-/tgB8mr5KdkJY7dIrKDoyfaT0PoaFyGLg7y3tBfFZOc=";
      };
    };
  });
  meta = {
    description = "Reactive navigation for wheeled robots using MRPT navigation algorithms (TP-Space)";
  };
})

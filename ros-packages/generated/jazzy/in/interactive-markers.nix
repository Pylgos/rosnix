{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclpy,
  rcutils,
  rmw,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "interactive_markers";
  version = "2.5.5-1";
  src = finalAttrs.passthru.sources."interactive_markers";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rclpy rcutils rmw std-msgs tf2 tf2-geometry-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rclpy rcutils rmw std-msgs tf2 tf2-geometry-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common builtin-interfaces ];
  passthru.sources = mkSourceSet (sources: {
    "interactive_markers" = substituteSource {
      src = fetchgit {
        name = "interactive_markers-source";
        url = "https://github.com/ros2-gbp/interactive_markers-release.git";
        rev = "7437e7bd24f4f1eb15f2d6401d5fa7a5e3307562";
        hash = "sha256-s38K7ph8Bx7NsWykPJOT/NU8bL9I0pnLgmYoT4FIN9A=";
      };
    };
  });
  meta = {
    description = "\n     3D interactive marker communication library for RViz and similar tools.\n  ";
  };
})

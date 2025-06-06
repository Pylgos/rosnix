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
  version = "2.5.4-2";
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
        rev = "0e209ec4bf7d7ab5eaf38ebe8d9375a04cf49eb0";
        hash = "sha256-AnynI7NBpQeYuWFq0tNqFBkjlyKyY5BekFPSGeZbmrs=";
      };
    };
  });
  meta = {
    description = "\n     3D interactive marker communication library for RViz and similar tools.\n  ";
  };
})

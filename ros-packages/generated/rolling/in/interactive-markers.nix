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
  version = "2.7.0-1";
  src = finalAttrs.passthru.sources."interactive_markers";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rclcpp rclpy rcutils rmw std-msgs tf2 tf2-geometry-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common builtin-interfaces ];
  passthru.sources = mkSourceSet (sources: {
    "interactive_markers" = substituteSource {
      src = fetchgit {
        name = "interactive_markers-source";
        url = "https://github.com/ros2-gbp/interactive_markers-release.git";
        rev = "12910416b6111a7c66270bad48233b2082e6c88b";
        hash = "sha256-jQjLj2lgC8AABlajmI3AdSmo6IEgMc5eU98M8Rua5Lo=";
      };
    };
  });
  meta = {
    description = "3D interactive marker communication library for RViz and similar tools.";
  };
})

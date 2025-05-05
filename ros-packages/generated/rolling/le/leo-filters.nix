{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_filters";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."leo_filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ generate-parameter-library rclcpp ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp-components sensor-msgs std-srvs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_filters" = substituteSource {
      src = fetchgit {
        name = "leo_filters-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "bb29e7d1a0e0aee15cf72e1ec98b644bbef72207";
        hash = "sha256-KnJqfKx0d7VMBIPd2yVxkvbB6RAoyCkw5Sj/N/zqzcc=";
      };
    };
  });
  meta = {
    description = "Nodes for filtering and processing imu and wheel odom messages.";
  };
})

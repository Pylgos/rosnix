{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  eigen-stl-containers,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  libmavconn,
  mavlink,
  mavros,
  mavros-msgs,
  message-filters,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rcpputils,
  rosSystemPackages,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-eigen,
  tf2-ros,
  trajectory-msgs,
  urdf,
  visualization-msgs,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mavros_extras";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."mavros_extras";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ angles diagnostic-msgs diagnostic-updater eigen3-cmake-module eigen-stl-containers geographic-msgs geometry-msgs libmavconn mavlink mavros mavros-msgs message-filters nav-msgs pluginlib rclcpp rclcpp-components rcpputils rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2-eigen tf2-ros trajectory-msgs urdf visualization-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "geographiclib" "geographiclib-tools" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ angles diagnostic-msgs diagnostic-updater eigen3-cmake-module eigen-stl-containers geographic-msgs geometry-msgs libmavconn mavlink mavros mavros-msgs message-filters nav-msgs pluginlib rclcpp rclcpp-components rcpputils rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2-eigen tf2-ros trajectory-msgs urdf visualization-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geographiclib" "geographiclib-tools" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "google-mock" "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mavros_extras" = substituteSource {
      src = fetchgit {
        name = "mavros_extras-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "0a1ceb892a8227cdf259568d2b081b1211bc55e8";
        hash = "sha256-GARgn60Uun+irf/9zkqMpt+YBwvHNQFViq0/068l/rA=";
      };
    };
  });
  meta = {
    description = "\n    Extra nodes and plugins for ";
  };
})

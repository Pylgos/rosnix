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
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."mavros_extras";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ angles diagnostic-msgs diagnostic-updater eigen-stl-containers geographic-msgs geometry-msgs libmavconn mavlink mavros mavros-msgs message-filters nav-msgs pluginlib rclcpp rclcpp-components rcpputils rosidl-default-runtime sensor-msgs std-msgs std-srvs tf2-eigen tf2-ros trajectory-msgs urdf visualization-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "geographiclib" "geographiclib-tools" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "google-mock" "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mavros_extras" = substituteSource {
      src = fetchgit {
        name = "mavros_extras-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "9a95489a9cb9169f873e4e76d3f87d33bb6a3517";
        hash = "sha256-0Sft+Dbd4AmQTB1lGYJBhNpcvF815kh9aO8P7/Es7Qc=";
      };
    };
  });
  meta = {
    description = "Extra nodes and plugins for";
  };
})

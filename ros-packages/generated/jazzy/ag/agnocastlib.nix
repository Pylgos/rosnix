{
  agnocast-cie-config-msgs,
  agnocast-cie-thread-configurator,
  ament-cmake,
  ament-cmake-gmock,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing-ament-cmake,
  message-filters,
  mkSourceSet,
  rcl-yaml-param-parser,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosgraph-msgs,
  std-msgs,
  substituteSource,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "agnocastlib";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."agnocastlib";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ agnocast-cie-config-msgs agnocast-cie-thread-configurator ament-index-cpp message-filters rcl-yaml-param-parser rclcpp rclcpp-components rosgraph-msgs tracetools ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libgoogle-glog-dev" "liblttng-ust-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ agnocast-cie-config-msgs agnocast-cie-thread-configurator ament-index-cpp message-filters rcl-yaml-param-parser rclcpp rclcpp-components rosgraph-msgs tracetools ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgoogle-glog-dev" "liblttng-ust-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common launch-testing-ament-cmake std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "agnocastlib" = substituteSource {
      src = fetchgit {
        name = "agnocastlib-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "56fd9971d545beb60b857a965f395c2ad9b0f9dd";
        hash = "sha256-rkm9gKtklBlaSdTfPwSy5W1o3S1soM6+ALYhQB1Ns+U=";
      };
    };
  });
  meta = {
    description = "\n    True Zero Copy Communication Middleware for Unsized ROS 2 Message Types.\n  ";
  };
})

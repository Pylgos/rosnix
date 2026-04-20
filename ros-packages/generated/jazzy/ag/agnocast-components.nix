{
  agnocast-cie-config-msgs,
  agnocast-cie-thread-configurator,
  agnocastlib,
  ament-cmake,
  buildAmentCmakePackage,
  class-loader,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing-ament-cmake,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "agnocast_components";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."agnocast_components";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ agnocast-cie-config-msgs agnocast-cie-thread-configurator agnocastlib class-loader rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libgoogle-glog-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ agnocast-cie-config-msgs agnocast-cie-thread-configurator agnocastlib class-loader rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgoogle-glog-dev" ]; };
  checkInputs = [ launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "agnocast_components" = substituteSource {
      src = fetchgit {
        name = "agnocast_components-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "87883e7a2a3d3c3f713e2ade55812f5735a0cff2";
        hash = "sha256-I4W5Dqj+S7VJ83fCP24rm+OvH0mFFTDlCDuFf+HXaKM=";
      };
    };
  });
  meta = {
    description = "\n    CMake tools for registering ROS 2 component nodes with Agnocast executor support.\n    Provides agnocast_components_register_node macro similar to rclcpp_components_register_node.\n  ";
  };
})

{
  ament-cmake,
  ament-cmake-ros,
  beluga,
  beluga-ros,
  bondcpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "beluga_amcl";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."beluga_amcl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ beluga beluga-ros bondcpp message-filters rclcpp rclcpp-components rclcpp-lifecycle std-srvs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ beluga beluga-ros bondcpp message-filters rclcpp rclcpp-components rclcpp-lifecycle std-srvs tf2-ros ];
  checkInputs = [ ament-cmake-ros ];
  passthru.sources = mkSourceSet (sources: {
    "beluga_amcl" = substituteSource {
      src = fetchgit {
        name = "beluga_amcl-source";
        url = "https://github.com/ros2-gbp/beluga-release.git";
        rev = "04c0915e593301e6196a66b6b0e4a5e292112044";
        hash = "sha256-DnjeKBN3e6+IM8wmW8hh9zQRQ8UYQzMeWFzbQftgD2M=";
      };
    };
  });
  meta = {
    description = "An AMCL node implementation for ROS2 using Beluga.";
  };
})

{
  action-msgs,
  action-tutorials-interfaces,
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "simple_actions";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."simple_actions";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ action-msgs rclcpp rclcpp-action rclpy ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ action-msgs rclcpp rclcpp-action rclpy ];
  checkInputs = [ action-tutorials-interfaces ];
  passthru.sources = mkSourceSet (sources: {
    "simple_actions" = substituteSource {
      src = fetchgit {
        name = "simple_actions-source";
        url = "https://github.com/ros2-gbp/simple_actions-release.git";
        rev = "dd41ab8acc4fe0dfbb8f16305dcd4b8f21e64b11";
        hash = "sha256-BC5T9iKxbIolH0TXwEUcRhXO0b9xjFOdnM4+le2X27Q=";
      };
    };
  });
  meta = {
    description = "Simple library for using the `rclpy/rclcpp` action libraries";
  };
})

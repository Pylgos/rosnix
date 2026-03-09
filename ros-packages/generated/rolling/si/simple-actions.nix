{
  action-msgs,
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-python,
  buildAmentCmakePackage,
  example-interfaces,
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
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."simple_actions";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ action-msgs rclcpp rclcpp-action rclpy ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ action-msgs rclcpp rclcpp-action rclpy ];
  checkInputs = [ ament-cmake-gtest example-interfaces ];
  passthru.sources = mkSourceSet (sources: {
    "simple_actions" = substituteSource {
      src = fetchgit {
        name = "simple_actions-source";
        url = "https://github.com/ros2-gbp/simple_actions-release.git";
        rev = "40c21e98d150af2efc46d94222b92cd0234e056d";
        hash = "sha256-+kUmpqw6Xx9NBSs+6n4SuVjCTwV8hy8qK0s8vh2t4Ck=";
      };
    };
  });
  meta = {
    description = "Simple library for using the `rclpy/rclcpp` action libraries";
  };
})

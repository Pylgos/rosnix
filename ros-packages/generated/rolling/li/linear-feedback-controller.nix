{
  ament-cmake-auto,
  ament-cmake-python,
  ament-lint-auto,
  buildAmentCmakePackage,
  control-toolbox,
  controller-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  gmock-vendor,
  gtest-vendor,
  hardware-interface,
  jrl-cmakemodules,
  linear-feedback-controller-msgs,
  message-filters,
  mkSourceSet,
  nav-msgs,
  pal-statistics,
  parameter-traits,
  pinocchio,
  pluginlib,
  rcl,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  rosSystemPackages,
  rosidl-dynamic-typesupport,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "linear_feedback_controller";
  version = "3.2.0-2";
  src = finalAttrs.passthru.sources."linear_feedback_controller";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedNativeBuildInputs = [ control-toolbox controller-interface generate-parameter-library hardware-interface jrl-cmakemodules linear-feedback-controller-msgs message-filters nav-msgs pal-statistics parameter-traits pinocchio pluginlib rcl rclcpp rclcpp-lifecycle realtime-tools rosidl-dynamic-typesupport sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "fmt" ]; };
  buildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ control-toolbox controller-interface generate-parameter-library hardware-interface jrl-cmakemodules linear-feedback-controller-msgs message-filters nav-msgs pal-statistics parameter-traits pinocchio pluginlib rcl rclcpp rclcpp-lifecycle realtime-tools rosidl-dynamic-typesupport sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" ]; };
  checkInputs = [ ament-lint-auto gmock-vendor gtest-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "linear_feedback_controller" = substituteSource {
      src = fetchgit {
        name = "linear_feedback_controller-source";
        url = "https://github.com/ros2-gbp/linear-feedback-controller-release.git";
        rev = "cae4e966e04028aba8d4cabad2db312b6cf6d0b9";
        hash = "sha256-6hlr0iqRySWOPuB7tQBmIz97wOVzUySr6lX43miiLu0=";
      };
    };
  });
  meta = {
    description = "\n    roscontrol controller package conputing a linear feedback. The user needs\n    to provide a model of the robot and a list of controlled joint and the\n    controller computes a linear feedback on the user defined state.\n  ";
  };
})

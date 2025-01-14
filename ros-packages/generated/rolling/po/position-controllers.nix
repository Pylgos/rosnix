{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward-command-controller,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "position_controllers";
  version = "4.19.0-1";
  src = finalAttrs.passthru.sources."position_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros forward-command-controller pluginlib rclcpp ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "position_controllers" = substituteSource {
      src = fetchgit {
        name = "position_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "7f0c28ffe8835df518153521ba665784e7b053b9";
        hash = "sha256-8we0VGh63wOot07Vh5X3BKcJD6K5Q8biWNopUOQ9eIs=";
      };
    };
  });
  meta = {
    description = "Generic position controller for forwarding position commands.";
  };
})

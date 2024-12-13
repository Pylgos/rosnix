{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  canopen-core,
  canopen-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lely-core-libraries,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_master_driver";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."canopen_master_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ canopen-core canopen-interfaces lely-core-libraries rclcpp rclcpp-components rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_master_driver" = substituteSource {
      src = fetchgit {
        name = "canopen_master_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "139c4b52ce978ae3cdfd7141184eb6179393d68b";
        hash = "sha256-AC98rSEvYBe2LvLqwAce3bbq9ek/f2tsWfuvmqVH2E8=";
      };
    };
  });
  meta = {
    description = "Basic canopen master implementation";
  };
})

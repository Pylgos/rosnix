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
  version = "0.2.12-2";
  src = finalAttrs.passthru.sources."canopen_master_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ canopen-core canopen-interfaces lely-core-libraries rclcpp rclcpp-components rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "canopen_master_driver" = substituteSource {
        src = fetchgit {
          name = "canopen_master_driver-source";
          url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
          rev = "0b313a48a078e56621e7a0e48243d06317dd55ab";
          hash = "sha256-q9p4r4Ehxpg6V21nKvFFI43mFR/o8aqo8CfYObevGXQ=";
        };
      };
    });
  };
  meta = {
    description = "Basic canopen master implementation";
  };
})

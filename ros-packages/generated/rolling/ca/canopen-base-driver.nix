{
  ament-cmake-ros,
  ament-lint-auto,
  buildAmentCmakePackage,
  canopen-core,
  canopen-interfaces,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  lely-core-libraries,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_base_driver";
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."canopen_base_driver";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ canopen-core canopen-interfaces diagnostic-updater lely-core-libraries rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ canopen-core canopen-interfaces diagnostic-updater lely-core-libraries rclcpp rclcpp-components rclcpp-lifecycle std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_base_driver" = substituteSource {
      src = fetchgit {
        name = "canopen_base_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "f36379f00d6e0578adce2c4e482d52ff3cc699bf";
        hash = "sha256-x0gzfo7S+kuG7+quEVaVULrQs/z5gVbVHC16Gs8sEHM=";
      };
    };
  });
  meta = {
    description = "Library containing abstract CANopen driver class for ros2_canopen";
  };
})

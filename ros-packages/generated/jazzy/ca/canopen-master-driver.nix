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
  version = "0.2.9-2";
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
          rev = "f879ab2ee6a9a8d8fa4f75531daaff0d1f07375e";
          hash = "sha256-xzkjzzOaEItvb16SVik9+qsQVSauWVtMX/phwDXKdDk=";
        };
      };
    });
  };
  meta = {
    description = "Basic canopen master implementation";
  };
})

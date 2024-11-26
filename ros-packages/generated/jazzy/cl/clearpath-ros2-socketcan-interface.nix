{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  can-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_ros2_socketcan_interface";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."clearpath_ros2_socketcan_interface";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ can-msgs rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "clearpath_ros2_socketcan_interface" = substituteSource {
        src = fetchgit {
          name = "clearpath_ros2_socketcan_interface-source";
          url = "https://github.com/clearpath-gbp/clearpath_ros2_socketcan_interface-release.git";
          rev = "811fedb0081776add503c15d657b8b0c03e6b2aa";
          hash = "sha256-AjrEmWigq3JPtpDT1LIrXSwoClkNYsrhG/4SNfaCS+A=";
        };
      };
    });
  };
  meta = {
    description = "A ROS 2 socketcan interface.";
  };
})

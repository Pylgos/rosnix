{
  ament-cmake,
  buildAmentCmakePackage,
  controller-interface,
  controller-manager,
  controller-manager-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  joint-limits,
  mkSourceSet,
  ros2-control-test-assets,
  ros2controlcli,
  rosSystemPackages,
  substituteSource,
  transmission-interface,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_control";
  version = "4.20.0-1";
  src = finalAttrs.passthru.sources."ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface controller-manager controller-manager-msgs hardware-interface joint-limits ros2-control-test-assets ros2controlcli transmission-interface ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2_control" = substituteSource {
        src = fetchgit {
          name = "ros2_control-source";
          url = "https://github.com/ros2-gbp/ros2_control-release.git";
          rev = "cd1ac957aa06838afc081ee4396e87ad1505df12";
          hash = "sha256-pFlka2vNwvUX/POnMSkEKnERim4tZ0v/VuL0JZRPxWc=";
        };
      };
    });
  };
  meta = {
    description = "Metapackage for ROS2 control related packages";
  };
})

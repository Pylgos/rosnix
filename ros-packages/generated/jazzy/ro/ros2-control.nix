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
  version = "4.24.0-1";
  src = finalAttrs.passthru.sources."ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface controller-manager controller-manager-msgs hardware-interface joint-limits ros2-control-test-assets ros2controlcli transmission-interface ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_control" = substituteSource {
      src = fetchgit {
        name = "ros2_control-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "ee47448050e5271edbf0219933fb896e8fe52ef1";
        hash = "sha256-gr2BUPEtSQEKD/XQYyUAmwjoHOx9eaICjtjqs0TtHXE=";
      };
    };
  });
  meta = {
    description = "Metapackage for ROS2 control related packages";
  };
})

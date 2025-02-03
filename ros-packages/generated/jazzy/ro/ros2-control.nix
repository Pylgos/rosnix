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
  version = "4.25.0-1";
  src = finalAttrs.passthru.sources."ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface controller-manager controller-manager-msgs hardware-interface joint-limits ros2-control-test-assets ros2controlcli transmission-interface ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_control" = substituteSource {
      src = fetchgit {
        name = "ros2_control-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "de036e6a33141614584ae258b8de0331357d02d4";
        hash = "sha256-Rv1GrZphhv+QAgLy3POdRI3hjMe94RvfI12AHgMjQJU=";
      };
    };
  });
  meta = {
    description = "Metapackage for ROS2 control related packages";
  };
})

{
  ament-cmake,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "ros2_control" = substituteSource {
      src = fetchgit {
        name = "ros2_control-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "4d45ee43cb37c6e37fe2c1a6adc17197109e57d6";
        hash = "sha256-hhJ1udOYXJqw8rAXi8ps9qsUmW2YhGwln9bx04ZTblQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "ros2_control";
  version = "4.18.0-1";
  src = finalAttrs.passthru.sources."ros2_control";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller-interface controller-manager controller-manager-msgs hardware-interface joint-limits ros2-control-test-assets ros2controlcli transmission-interface ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Metapackage for ROS2 control related packages";
  };
})

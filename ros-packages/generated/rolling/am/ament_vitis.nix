{
  ament_acceleration,
  ament_cmake_core,
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ament_vitis" = substituteSource {
      src = fetchgit {
        name = "ament_vitis-source";
        url = "https://github.com/ros2-gbp/ament_vitis-release.git";
        rev = "507aba5803629e67cb3b04642addaee101911f4e";
        hash = "sha256-Na2vZDmx1yo4NFMDS9mmn1De1NRtjjs953gSAHRCxtc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_vitis";
  version = "0.10.1-4";
  src = sources."ament_vitis";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_acceleration ament_cmake_core ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_acceleration ament_cmake_core ament_cmake_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CMake macros and utilities to include Vitis platform into the ROS 2 build system (ament) and its development flows.";
  };
}
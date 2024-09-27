{
  ament_acceleration,
  ament_cmake_core,
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_vitis-270441817e4e65c986495b325a82f04e7e51c926 = substituteSource {
      src = fetchgit {
        name = "ament_vitis-270441817e4e65c986495b325a82f04e7e51c926-source";
        url = "https://github.com/ros2-gbp/ament_vitis-release.git";
        rev = "270441817e4e65c986495b325a82f04e7e51c926";
        hash = "sha256-Na2vZDmx1yo4NFMDS9mmn1De1NRtjjs953gSAHRCxtc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_vitis";
  version = "0.10.1-5";
  src = sources.ament_vitis-270441817e4e65c986495b325a82f04e7e51c926;
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

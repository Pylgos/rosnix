{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  ament_vitis,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  opencl-headers,
  substituteSource,
}:
let
  sources = rec {
    vitis_common = substituteSource {
      src = fetchgit {
        name = "vitis_common-source";
        url = "https://github.com/ros2-gbp/vitis_common-release.git";
        rev = "28bbce9694fa95111d41b949a4c850475095198f";
        hash = "sha256-K6BliyL56las1cA019YmPWtcy/bVEejNPaYTF7SVYic=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vitis_common";
  version = "0.4.2-4";
  src = sources.vitis_common;
  nativeBuildInputs = [ ament_cmake ament_vitis ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ opencl-headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [ "ocl-icd-opencl-dev" ];
  meta = {
    description = "Common code for working with Vitis™ Unified Software Platform in ROS.";
  };
}

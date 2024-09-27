{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  ament_vitis,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    vitis_common-4abbf109e88120dbdd434027d9747317aec5d032 = substituteSource {
      src = fetchgit {
        name = "vitis_common-4abbf109e88120dbdd434027d9747317aec5d032-source";
        url = "https://github.com/ros2-gbp/vitis_common-release.git";
        rev = "4abbf109e88120dbdd434027d9747317aec5d032";
        hash = "sha256-K6BliyL56las1cA019YmPWtcy/bVEejNPaYTF7SVYic=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vitis_common";
  version = "0.4.2-3";
  src = sources.vitis_common-4abbf109e88120dbdd434027d9747317aec5d032;
  nativeBuildInputs = [ ament_cmake ament_vitis ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ocl-icd-opencl-dev" "opencl-headers" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Common code for working with Vitis™ Unified Software Platform in ROS.";
  };
}

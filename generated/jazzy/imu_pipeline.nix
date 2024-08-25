{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu_processors,
  imu_transformer,
  substituteSource,
}:
let
  sources = rec {
    imu_pipeline = substituteSource {
      src = fetchgit {
        name = "imu_pipeline-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "97bb02692bfea574dd283391bd56ec611cd8fd70";
        hash = "sha256-dJGjG62iCrupov3xWznx6yfooP5Q5w6rg7pfsX1P9x0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_pipeline";
  version = "0.5.0-3";
  src = sources.imu_pipeline;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ imu_processors imu_transformer ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "imu_pipeline";
  };
}

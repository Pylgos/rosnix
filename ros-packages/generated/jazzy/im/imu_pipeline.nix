{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu_processors,
  imu_transformer,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    imu_pipeline-97bb02692bfea574dd283391bd56ec611cd8fd70 = substituteSource {
      src = fetchgit {
        name = "imu_pipeline-97bb02692bfea574dd283391bd56ec611cd8fd70-source";
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
  src = sources.imu_pipeline-97bb02692bfea574dd283391bd56ec611cd8fd70;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ imu_processors imu_transformer ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "imu_pipeline";
  };
}

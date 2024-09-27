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
    imu_pipeline-f4f45b6e65736bb43363ee7c1dd9d0663ec936d5 = substituteSource {
      src = fetchgit {
        name = "imu_pipeline-f4f45b6e65736bb43363ee7c1dd9d0663ec936d5-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "f4f45b6e65736bb43363ee7c1dd9d0663ec936d5";
        hash = "sha256-dJGjG62iCrupov3xWznx6yfooP5Q5w6rg7pfsX1P9x0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_pipeline";
  version = "0.5.0-2";
  src = sources.imu_pipeline-f4f45b6e65736bb43363ee7c1dd9d0663ec936d5;
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

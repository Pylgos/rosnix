{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-kernel,
  mrpt-libmaps,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "mola_input_kitti360_dataset" = substituteSource {
      src = fetchgit {
        name = "mola_input_kitti360_dataset-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "c563fef99385f939811a0f759642ef9abbdefe35";
        hash = "sha256-lAkKH7r/lQuGL5Uq/t4jVuRKBAbEu0LBIgOmM7k/VT0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mola_input_kitti360_dataset";
  version = "1.2.0-1";
  src = sources."mola_input_kitti360_dataset";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola-common mola-kernel mrpt-libmaps ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Offline RawDataSource from Kitti-360 datasets";
  };
}

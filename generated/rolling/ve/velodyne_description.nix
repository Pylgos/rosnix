{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = rec {
    velodyne_description-8a50bb988e62803eec12aa93c76b0927a2b3f0b8 = substituteSource {
      src = fetchgit {
        name = "velodyne_description-8a50bb988e62803eec12aa93c76b0927a2b3f0b8-source";
        url = "https://github.com/ros2-gbp/velodyne_simulator-release.git";
        rev = "8a50bb988e62803eec12aa93c76b0927a2b3f0b8";
        hash = "sha256-vYig3j3DqPeSuEmGlDfvaH64IGdK8x/Yxx40R/Sv5j4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_description";
  version = "2.0.3-3";
  src = sources.velodyne_description-8a50bb988e62803eec12aa93c76b0927a2b3f0b8;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ urdf xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "URDF and meshes describing Velodyne laser scanners.";
  };
}

{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  velodyne_description,
  velodyne_gazebo_plugins,
}:
let
  sources = rec {
    velodyne_simulator-9712ff3d59669d42d80aa5a0b19297a24052407c = substituteSource {
      src = fetchgit {
        name = "velodyne_simulator-9712ff3d59669d42d80aa5a0b19297a24052407c-source";
        url = "https://github.com/ros2-gbp/velodyne_simulator-release.git";
        rev = "9712ff3d59669d42d80aa5a0b19297a24052407c";
        hash = "sha256-Cu17nhMENoRv3E5+1HvQyw35oWBdZXPr9BQ3APt4Q0c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_simulator";
  version = "2.0.3-3";
  src = sources.velodyne_simulator-9712ff3d59669d42d80aa5a0b19297a24052407c;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ velodyne_description velodyne_gazebo_plugins ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage allowing easy installation of Velodyne simulation components.";
  };
}

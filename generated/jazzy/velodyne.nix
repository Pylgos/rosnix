{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  velodyne_driver,
  velodyne_laserscan,
  velodyne_msgs,
  velodyne_pointcloud,
}:
let
  sources = rec {
    velodyne = substituteSource {
      src = fetchgit {
        name = "velodyne-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "94c7ffc762f021d72b7295602f86f988b7e10160";
        hash = "sha256-Wr9qH+muZay+hoPYPI7pJRs11jWr4I26LKKsmaWL/4A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne";
  version = "2.3.0-4";
  src = sources.velodyne;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ velodyne_driver velodyne_laserscan velodyne_msgs velodyne_pointcloud ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Basic ROS support for the Velodyne 3D LIDARs.";
  };
}

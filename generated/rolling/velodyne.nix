{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
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
        rev = "a4862d6b99f2a857fc3e0d5c17cac86296c51e51";
        hash = "sha256-Wr9qH+muZay+hoPYPI7pJRs11jWr4I26LKKsmaWL/4A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne";
  version = "2.3.0-3";
  src = sources.velodyne;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ velodyne_driver velodyne_laserscan velodyne_msgs velodyne_pointcloud ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Basic ROS support for the Velodyne 3D LIDARs.";
  };
}

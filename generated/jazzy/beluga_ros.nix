{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_python,
  beluga,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  python3Packages,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    beluga_ros = substituteSource {
      src = fetchgit {
        name = "beluga_ros-source";
        url = "https://github.com/ros2-gbp/beluga-release.git";
        rev = "2ce8e69bfddd01c5c394c9b23c499a4a6f18ce55";
        hash = "sha256-4RnTLzRcla3M7v/bkXIxVunsAemyZVO4lcW3K5gSeUA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "beluga_ros";
  version = "2.0.2-1";
  src = sources.beluga_ros;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ beluga geometry_msgs nav_msgs python3Packages.h5py python3Packages.matplotlib python3Packages.scipy sensor_msgs std_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "Utilities to interface ROS with Beluga.";
  };
}

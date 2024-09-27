{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_python,
  beluga,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rosSystemPackages,
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
    beluga_ros-2ce8e69bfddd01c5c394c9b23c499a4a6f18ce55 = substituteSource {
      src = fetchgit {
        name = "beluga_ros-2ce8e69bfddd01c5c394c9b23c499a4a6f18ce55-source";
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
  src = sources.beluga_ros-2ce8e69bfddd01c5c394c9b23c499a4a6f18ce55;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ beluga geometry_msgs nav_msgs sensor_msgs std_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_ros visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-h5py" "python3-matplotlib" "python3-scipy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Utilities to interface ROS with Beluga.";
  };
}

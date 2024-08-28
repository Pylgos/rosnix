{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  cppzmq,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mrpt_libgui,
  mrpt_libmaps,
  mrpt_libposes,
  mrpt_libros_bridge,
  mrpt_libtclap,
  nav_msgs,
  protobuf,
  python3,
  python3Packages,
  rclcpp,
  ros2launch,
  ros_environment,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  unzip,
  visualization_msgs,
  wget,
}:
let
  sources = rec {
    mvsim = substituteSource {
      src = fetchgit {
        name = "mvsim-source";
        url = "https://github.com/ros2-gbp/mvsim-release.git";
        rev = "d8b9294ebeddd89708fbc597d63c7d034821bdd1";
        hash = "sha256-fRwEC+/pNuYDTorLW+TRc1K0o8oRvfTnMXGqtXn2Alc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mvsim";
  version = "0.10.0-1";
  src = sources.mvsim;
  nativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment unzip wget ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cppzmq cv_bridge geometry_msgs mrpt_libgui mrpt_libmaps mrpt_libposes mrpt_libros_bridge mrpt_libtclap nav_msgs protobuf python3 python3Packages.boost python3Packages.pip python3Packages.protobuf python3Packages.pybind11 rclcpp ros2launch sensor_msgs std_msgs stereo_msgs tf2 tf2_geometry_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A lightweight multivehicle simulation framework.";
  };
}

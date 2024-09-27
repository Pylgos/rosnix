{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
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
  rclcpp,
  ros2launch,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    mvsim-3ba55bc51c40f93c428423f7a04d7ead15e0a2e5 = substituteSource {
      src = fetchgit {
        name = "mvsim-3ba55bc51c40f93c428423f7a04d7ead15e0a2e5-source";
        url = "https://github.com/ros2-gbp/mvsim-release.git";
        rev = "3ba55bc51c40f93c428423f7a04d7ead15e0a2e5";
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
  src = sources.mvsim-3ba55bc51c40f93c428423f7a04d7ead15e0a2e5;
  nativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "unzip" "wget" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge geometry_msgs mrpt_libgui mrpt_libmaps mrpt_libposes mrpt_libros_bridge mrpt_libtclap nav_msgs rclcpp ros2launch sensor_msgs std_msgs stereo_msgs tf2 tf2_geometry_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libzmq3-dev" "protobuf-dev" "pybind11-dev" "python3-pip" "python3-protobuf" "python3-venv" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A lightweight multivehicle simulation framework.";
  };
}

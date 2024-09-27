{
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_kernel,
  mrpt_libobs,
  mrpt_libros_bridge,
  rosSystemPackages,
  rosbag2_cpp,
  sensor_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_msgs,
  tf2_ros,
}:
let
  sources = rec {
    mola_input_rosbag2-ba4d2593cf14c4e54accf1bc65f9e8972a3b9c2e = substituteSource {
      src = fetchgit {
        name = "mola_input_rosbag2-ba4d2593cf14c4e54accf1bc65f9e8972a3b9c2e-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "ba4d2593cf14c4e54accf1bc65f9e8972a3b9c2e";
        hash = "sha256-kBR9+UaZDQR6UJWCv4sX/M1FOVtGPR0aG8b9+gr/BbI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_input_rosbag2";
  version = "1.2.0-1";
  src = sources.mola_input_rosbag2-ba4d2593cf14c4e54accf1bc65f9e8972a3b9c2e;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge mola_kernel mrpt_libobs mrpt_libros_bridge rosbag2_cpp sensor_msgs tf2_geometry_msgs tf2_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Offline RawDataSource from rosbag2 datasets";
  };
}

{
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
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
  sources = mkSourceSet (sources: {
    "mola_input_rosbag2" = substituteSource {
      src = fetchgit {
        name = "mola_input_rosbag2-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "ddc5d7678d1c5459adcebdc27fff29e4d10e18f0";
        hash = "sha256-kBR9+UaZDQR6UJWCv4sX/M1FOVtGPR0aG8b9+gr/BbI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mola_input_rosbag2";
  version = "1.2.0-1";
  src = sources."mola_input_rosbag2";
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

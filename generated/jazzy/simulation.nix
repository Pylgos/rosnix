{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_base,
  ros_gz_bridge,
  ros_gz_image,
  ros_gz_interfaces,
  ros_gz_sim,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    simulation = substituteSource {
      src = fetchgit {
        name = "simulation-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "a3513af0b98ac4456aeeb919c038ab17b02c3fbb";
        hash = "sha256-F5Xdwf30yp+svq3b6jwcfeMbm+oLQKi9hw3ZkozBy68=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "simulation";
  version = "0.11.0-1";
  src = sources.simulation;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ros_base ros_gz_bridge ros_gz_image ros_gz_interfaces ros_gz_sim ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package which extends 'ros_base' and includes simulation packages.";
  };
}

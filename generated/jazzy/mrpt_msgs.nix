{
  ament_cmake,
  ament_cppcheck,
  ament_cpplint,
  ament_lint_auto,
  ament_lint_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    mrpt_msgs = substituteSource {
      src = fetchgit {
        name = "mrpt_msgs-source";
        url = "https://github.com/ros2-gbp/mrpt_msgs-release.git";
        rev = "58cee178b86be2e6a62b1c4895603c4d10a3939a";
        hash = "sha256-aWWfgmGZaX5Hai0iTV9oUl1V2Gz9/csFD9tIVQdlPRE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_msgs";
  version = "0.4.7-3";
  src = sources.mrpt_msgs;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cppcheck ament_cpplint ament_lint_auto ament_lint_cmake ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS messages for MRPT classes and objects";
  };
}

{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    kinematics_interface-943dd2263789b2a4e6f039ce5f9ccf0901950c01 = substituteSource {
      src = fetchgit {
        name = "kinematics_interface-943dd2263789b2a4e6f039ce5f9ccf0901950c01-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "943dd2263789b2a4e6f039ce5f9ccf0901950c01";
        hash = "sha256-NIcnxxLBdixzZQeXN0f2g03lIQQMoKqYrwTiwVagNSE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kinematics_interface";
  version = "1.1.0-1";
  src = sources.kinematics_interface-943dd2263789b2a4e6f039ce5f9ccf0901950c01;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp_lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Kinematics interface for ROS 2 control";
  };
}

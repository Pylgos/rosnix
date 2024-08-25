{
  ament_cmake,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    kinematics_interface = substituteSource {
      src = fetchgit {
        name = "kinematics_interface-source";
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
  src = sources.kinematics_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Kinematics interface for ROS 2 control";
  };
}

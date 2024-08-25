{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  demo_nodes_py,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
  nodl_python,
  python3Packages,
  ros2launch,
  sros2,
  substituteSource,
}:
let
  sources = rec {
    ros2launch_security = substituteSource {
      src = fetchgit {
        name = "ros2launch_security-source";
        url = "https://github.com/ros2-gbp/ros2launch_security-release.git";
        rev = "e896c13bfc8f93f259902eec99483b65336b2458";
        hash = "sha256-MM1mvGLVBpSePXEUKQScahRPpulucGxMTaTp+jSKbNo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2launch_security";
  version = "1.0.0-5";
  src = sources.ros2launch_security;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python nodl_python ros2launch sros2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 demo_nodes_py launch_ros python3Packages.pytest ros2launch sros2 ];
  missingDependencies = [  ];
  meta = {
    description = "Security extensions for ros2 launch";
  };
}

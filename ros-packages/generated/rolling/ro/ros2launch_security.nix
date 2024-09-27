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
  ros2launch,
  rosSystemPackages,
  sros2,
  substituteSource,
}:
let
  sources = rec {
    ros2launch_security-43e55f1907071b6ac525d871539b6a3a8b9f11ca = substituteSource {
      src = fetchgit {
        name = "ros2launch_security-43e55f1907071b6ac525d871539b6a3a8b9f11ca-source";
        url = "https://github.com/ros2-gbp/ros2launch_security-release.git";
        rev = "43e55f1907071b6ac525d871539b6a3a8b9f11ca";
        hash = "sha256-MM1mvGLVBpSePXEUKQScahRPpulucGxMTaTp+jSKbNo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2launch_security";
  version = "1.0.0-4";
  src = sources.ros2launch_security-43e55f1907071b6ac525d871539b6a3a8b9f11ca;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python nodl_python ros2launch sros2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 demo_nodes_py launch_ros ros2launch sros2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Security extensions for ros2 launch";
  };
}

{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_xml,
  rclpy,
  rmf_fleet_adapter_python,
  rmf_fleet_msgs,
  rmf_task_msgs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_demos_fleet_adapter-d2f0ae7941e5a3e6e80363b12c21459549f20dee = substituteSource {
      src = fetchgit {
        name = "rmf_demos_fleet_adapter-d2f0ae7941e5a3e6e80363b12c21459549f20dee-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "d2f0ae7941e5a3e6e80363b12c21459549f20dee";
        hash = "sha256-dFYB9ED6GHbtco3ON4yzv8St6msZjkHD7rh0QiCmyC4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_demos_fleet_adapter";
  version = "2.4.0-1";
  src = sources.rmf_demos_fleet_adapter-d2f0ae7941e5a3e6e80363b12c21459549f20dee;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch_xml rclpy rmf_fleet_adapter_python rmf_fleet_msgs rmf_task_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-fastapi" "python3-flask-socketio" "python3-numpy" "python3-pydantic" "python3-pyproj" "python3-requests" "python3-uvicorn" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Fleet adapters for interfacing with RMF Demos robots with a fleet manager via REST API";
  };
}

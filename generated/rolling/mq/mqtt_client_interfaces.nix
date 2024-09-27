{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    mqtt_client_interfaces-5bbfaa35ec2e98fd94da37e5878c53a910930c1e = substituteSource {
      src = fetchgit {
        name = "mqtt_client_interfaces-5bbfaa35ec2e98fd94da37e5878c53a910930c1e-source";
        url = "https://github.com/ros2-gbp/mqtt_client-release.git";
        rev = "5bbfaa35ec2e98fd94da37e5878c53a910930c1e";
        hash = "sha256-uodTNl9Jgjak1DPQpOe1aOEwSCdyfYY8zvExpOctHJE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mqtt_client_interfaces";
  version = "2.3.0-1";
  src = sources.mqtt_client_interfaces-5bbfaa35ec2e98fd94da37e5878c53a910930c1e;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Message and service definitions for mqtt_client";
  };
}

{
  ament_cmake,
  buildRosPackage,
  etsi_its_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_msgs_utils-d0c358b4a8bc6ab2d51f4350621a7ed0668835fd = substituteSource {
      src = fetchgit {
        name = "etsi_its_msgs_utils-d0c358b4a8bc6ab2d51f4350621a7ed0668835fd-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "d0c358b4a8bc6ab2d51f4350621a7ed0668835fd";
        hash = "sha256-s7PhbM4SnhusmUCCG8ug/MWgO4ldBUnvw4HkyS4/jwE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_msgs_utils";
  version = "2.2.0-1";
  src = sources.etsi_its_msgs_utils-d0c358b4a8bc6ab2d51f4350621a7ed0668835fd;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi_its_msgs geometry_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS messages and utility functions for ETSI ITS messages";
  };
}

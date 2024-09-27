{
  ament_cmake,
  buildRosPackage,
  etsi_its_cam_coding,
  etsi_its_cam_msgs,
  etsi_its_primitives_conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_cam_conversion-a6242dd97954e8bdfde3d122b08f5320e8447e13 = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_conversion-a6242dd97954e8bdfde3d122b08f5320e8447e13-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "a6242dd97954e8bdfde3d122b08f5320e8447e13";
        hash = "sha256-CEsLKxHi9C6KNWaweJf2o3Eaj9+kO58l6K0k6n8zovk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_cam_conversion";
  version = "2.2.0-1";
  src = sources.etsi_its_cam_conversion-a6242dd97954e8bdfde3d122b08f5320e8447e13;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi_its_cam_coding etsi_its_cam_msgs etsi_its_primitives_conversion ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS CAMs";
  };
}

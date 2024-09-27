{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_cam_ts_coding-a9451fa56e4855986284f6a7e56480e808442acf = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_ts_coding-a9451fa56e4855986284f6a7e56480e808442acf-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "a9451fa56e4855986284f6a7e56480e808442acf";
        hash = "sha256-swHbaT+RJ3isjR1zTTSc8PD6DtmzbQOOY+Shpemqn0U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_cam_ts_coding";
  version = "2.2.0-1";
  src = sources.etsi_its_cam_ts_coding-a9451fa56e4855986284f6a7e56480e808442acf;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ compatible C source code for ETSI ITS CAMs (TS) generated from ASN.1 using asn1c";
  };
}

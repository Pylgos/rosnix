{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-msgs,
  etsi-its-cam-ts-msgs,
  etsi-its-cpm-ts-msgs,
  etsi-its-denm-msgs,
  etsi-its-vam-ts-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "etsi_its_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "48c98e62ab5882f00405d763e64a23fe006adec7";
        hash = "sha256-POUmlgRsSsbbYZW4XgklJfHs2Tmj/70M7DrR1qzrugE=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_msgs";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi-its-cam-msgs etsi-its-cam-ts-msgs etsi-its-cpm-ts-msgs etsi-its-denm-msgs etsi-its-vam-ts-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "ROS messages for ETSI ITS messages";
  };
})

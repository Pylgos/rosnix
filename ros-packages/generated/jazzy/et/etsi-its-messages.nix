{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-coding,
  etsi-its-conversion,
  etsi-its-msgs,
  etsi-its-msgs-utils,
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
    "etsi_its_messages" = substituteSource {
      src = fetchgit {
        name = "etsi_its_messages-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "556bcb77766112cb65eda7ebf79a42da0e5cfcac";
        hash = "sha256-UX+kBxhPUV7heB9zwtqzkClUpEU6ZG1OzLzkNfeps5E=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_messages";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_messages";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ etsi-its-coding etsi-its-conversion etsi-its-msgs etsi-its-msgs-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "ROS support for ETSI ITS messages";
  };
})

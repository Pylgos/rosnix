{
  ament_cmake_auto,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    qpoases_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "qpoases_vendor-source";
        owner = "ros2-gbp";
        repo = "qpoases_vendor-release";
        rev = "6977e38b5ee572d56948a64c432cc76c4bae9d20";
        hash = "sha256-jUSNiB8b0P8JHYXdXeKMs5Ucxjk+fhbPqxcJnD2GIQ4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qpoases_vendor";
  version = "3.2.3-4";
  src = sources.qpoases_vendor;
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "subversion" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around qpOASES to make it available to the ROS ecosystem.";
  };
}

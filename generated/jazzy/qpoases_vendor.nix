{
  ament_cmake_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  subversion,
}:
let
  sources = rec {
    qpoases_vendor = substituteSource {
      src = fetchgit {
        name = "qpoases_vendor-source";
        url = "https://github.com/ros2-gbp/qpoases_vendor-release.git";
        rev = "b00c8ebcfedecf8b34d02b6e9ce45d641efc43e8";
        hash = "sha256-jUSNiB8b0P8JHYXdXeKMs5Ucxjk+fhbPqxcJnD2GIQ4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qpoases_vendor";
  version = "3.2.3-5";
  src = sources.qpoases_vendor;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ subversion ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Wrapper around qpOASES to make it available to the ROS ecosystem.";
  };
}

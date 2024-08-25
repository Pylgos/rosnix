{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libusb1,
  nlohmann_json,
  opencv,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    depthai = substituteSource {
      src = fetchgit {
        name = "depthai-source";
        url = "https://github.com/luxonis/depthai-core-release.git";
        rev = "e4fd65105cdb7dada82c05670ea41fff244954d7";
        hash = "sha256-Z/nhOI5KHM7IdolX9uRSTJNKaqqzNAqU+ubBOBFkWKI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai";
  version = "2.28.0-1";
  src = sources.depthai;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libusb1 nlohmann_json opencv ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "DepthAI core is a C++ library which comes with firmware and an API to interact with OAK Platform";
  };
}

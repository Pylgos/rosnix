{
  ament_cmake,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ur_client_library = substituteSource {
      src = fetchgit {
        name = "ur_client_library-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_Client_Library-release.git";
        rev = "7b49bedc1739c2faf3b79d3f993fd77b9e3f2870";
        hash = "sha256-ZtZ7wH2xmYhDXoGeeIA30rqkhK9iiy0RK2bOZDD27kY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_client_library";
  version = "1.3.7-1";
  src = sources.ur_client_library;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Standalone C++ library for accessing Universal Robots interfaces. This has been forked off the ur_robot_driver.";
  };
}

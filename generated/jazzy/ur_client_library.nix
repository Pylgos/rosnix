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
        rev = "309d7d3088caee29b2af1a41f0ea161bf04940d0";
        hash = "sha256-AGri1LrjEomT9pPJAVN53G3Zf0W2GNqlCIgLZt9Odns=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_client_library";
  version = "1.4.0-1";
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

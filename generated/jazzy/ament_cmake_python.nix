{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_python = substituteSource {
      src = fetchgit {
        name = "ament_cmake_python-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "3af1fe8eeb1cd05a19e9d35d2356247b3277c576";
        hash = "sha256-pBQquv6pNDPWHZ5Bd454RyTXLa1f+h81olEcIzDZeWM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_python";
  version = "2.5.2-1";
  src = sources.ament_cmake_python;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to use Python in the ament buildsystem in CMake.";
  };
}

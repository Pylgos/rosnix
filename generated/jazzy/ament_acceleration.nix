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
    ament_acceleration = substituteSource {
      src = fetchgit {
        name = "ament_acceleration-source";
        url = "https://github.com/ros2-gbp/ament_acceleration-release.git";
        rev = "7e0cf4e578a5509e687bb9e0f36398e0334a0e62";
        hash = "sha256-tnkilfsTlrhC8xcFlu9E8VIt8hGsNKCcdD53KV8JRac=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_acceleration";
  version = "0.2.0-5";
  src = sources.ament_acceleration;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "CMake macros and utilities to include hardware acceleration into the ROS 2 build system (ament) and its development flows.";
  };
}

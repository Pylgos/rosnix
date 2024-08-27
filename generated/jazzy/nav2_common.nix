{
  ament_cmake_core,
  ament_cmake_python,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  osrf_pycommon,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    nav2_common = substituteSource {
      src = fetchgit {
        name = "nav2_common-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "3b721daad17330c8f5cacb4401bc000e281f2503";
        hash = "sha256-KTLurzrQG9qo/LpbBTVH2NzbYa639rHXC/ODl04veCM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_common";
  version = "1.3.2-1";
  src = sources.nav2_common;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_python buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch launch_ros osrf_pycommon rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Common support functionality used throughout the navigation 2 stack";
  };
}

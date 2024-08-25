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
        rev = "11da3bf82def61c133d0ad4353a83280f088c42d";
        hash = "sha256-xwvOsQ9AbDsqOfY07YmwujiyOUEammC7QMr3LbqnfD0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_common";
  version = "1.3.1-1";
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

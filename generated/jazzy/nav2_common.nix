{
  ament_cmake_core,
  ament_cmake_python,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  osrf_pycommon,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    nav2_common = substituteSource {
      src = fetchFromGitHub {
        name = "nav2_common-source";
        owner = "SteveMacenski";
        repo = "navigation2-release";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch launch_ros osrf_pycommon rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Common support functionality used throughout the navigation 2 stack";
  };
}

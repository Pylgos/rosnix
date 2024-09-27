{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    leo_gz_worlds-0b56515cc9fcb0a59080c1f37dbfaa6e9a46cbf7 = substituteSource {
      src = fetchgit {
        name = "leo_gz_worlds-0b56515cc9fcb0a59080c1f37dbfaa6e9a46cbf7-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "0b56515cc9fcb0a59080c1f37dbfaa6e9a46cbf7";
        hash = "sha256-EK1pczV1p2fHTbGPgwjCdNvPHbNkIXiSHcLDo6OfCGQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_gz_worlds";
  version = "2.0.0-1";
  src = sources.leo_gz_worlds-0b56515cc9fcb0a59080c1f37dbfaa6e9a46cbf7;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Gazebo worlds for Leo Rover simulation in ROS 2";
  };
}

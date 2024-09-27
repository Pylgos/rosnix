{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros2cli,
  ros2pkg,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ros2run-5f07e2d9f5b281179e66b8db861fae89bec28750 = substituteSource {
      src = fetchgit {
        name = "ros2run-5f07e2d9f5b281179e66b8db861fae89bec28750-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "5f07e2d9f5b281179e66b8db861fae89bec28750";
        hash = "sha256-b47uz+wWc18dLvBagcwf6HiDyCOJMzRparykgHbsYIo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2run";
  version = "0.32.1-1";
  src = sources.ros2run-5f07e2d9f5b281179e66b8db861fae89bec28750;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ros2cli ros2pkg ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  meta = {
    description = "The run command for ROS 2 command line tools.";
  };
}

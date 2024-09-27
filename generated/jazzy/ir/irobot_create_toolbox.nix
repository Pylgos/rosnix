{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_math_vendor,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    irobot_create_toolbox-7c9283a95e70e97fe434f2738523500d3bfde64a = substituteSource {
      src = fetchgit {
        name = "irobot_create_toolbox-7c9283a95e70e97fe434f2738523500d3bfde64a-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "7c9283a95e70e97fe434f2738523500d3bfde64a";
        hash = "sha256-1Xz8PBcCKddOydL4GpJyR/Ojnok3SvV4iMNh68o8a2g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_toolbox";
  version = "3.0.2-2";
  src = sources.irobot_create_toolbox-7c9283a95e70e97fe434f2738523500d3bfde64a;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ gz_math_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_flake8 ament_cmake_lint_cmake ament_cmake_pep257 ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Components and helpers for the iRobot(R) Create(R) 3 Educational Robot.";
  };
}

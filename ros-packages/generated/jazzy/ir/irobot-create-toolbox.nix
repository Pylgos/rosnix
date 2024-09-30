{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-math-vendor,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "irobot_create_toolbox" = substituteSource {
      src = fetchgit {
        name = "irobot_create_toolbox-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "7c9283a95e70e97fe434f2738523500d3bfde64a";
        hash = "sha256-1Xz8PBcCKddOydL4GpJyR/Ojnok3SvV4iMNh68o8a2g=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "irobot_create_toolbox";
  version = "3.0.2-2";
  src = sources."irobot_create_toolbox";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ gz-math-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Components and helpers for the iRobot(R) Create(R) 3 Educational Robot.";
  };
}

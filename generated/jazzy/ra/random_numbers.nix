{
  ament_cmake,
  ament_lint_auto,
  ament_lint_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    random_numbers-bc34cb9eb07ea35f6aa223286de5e1bb40c689af = substituteSource {
      src = fetchgit {
        name = "random_numbers-bc34cb9eb07ea35f6aa223286de5e1bb40c689af-source";
        url = "https://github.com/ros2-gbp/random_numbers-release.git";
        rev = "bc34cb9eb07ea35f6aa223286de5e1bb40c689af";
        hash = "sha256-hQN9n+tLK1rKA+wXOXW/TfT4RzrXxvaIfDlzgV+LJnU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "random_numbers";
  version = "2.0.1-5";
  src = sources.random_numbers-bc34cb9eb07ea35f6aa223286de5e1bb40c689af;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-date-time" "libboost-date-time-dev" "libboost-dev" "libboost-random" "libboost-random-dev" "libboost-thread" "libboost-thread-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This library contains wrappers for generating floating point values, integers, quaternions using boost libraries. The constructor of the wrapper is guaranteed to be thread safe and initialize its random number generator to a random seed. Seeds are obtained using a separate and different random number generator.";
  };
}

{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    angles = substituteSource {
      src = fetchFromGitHub {
        name = "angles-source";
        owner = "ros2-gbp";
        repo = "angles-release";
        rev = "9192c8b6ce21463dcfb1afdb7312257603f34d11";
        hash = "sha256-l4xIXnIMoWmTEkIubTtt1g/NZdI+H9zvYXd0izyPAKw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "angles";
  version = "1.16.0-5";
  src = sources.angles;
  nativeBuildInputs = [ ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-setuptools" ]; };
  propagatedNativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package provides a set of simple math utilities to work with angles. The utilities cover simple things like normalizing an angle and conversion between degrees and radians. But even if you're trying to calculate things like the shortest angular distance between two joint space positions of your robot, but the joint motion is constrained by joint limits, this package is what you need. The code in this package is stable and well tested. There are no plans for major changes in the near future.";
  };
}

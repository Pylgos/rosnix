{
  ament_cmake,
  ament_cmake_python,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    angles = substituteSource {
      src = fetchgit {
        name = "angles-source";
        url = "https://github.com/ros2-gbp/angles-release.git";
        rev = "327da84cd9263d1231e9a82d5942baf744b833bc";
        hash = "sha256-l4xIXnIMoWmTEkIubTtt1g/NZdI+H9zvYXd0izyPAKw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "angles";
  version = "1.16.0-4";
  src = sources.angles;
  nativeBuildInputs = [ ament_cmake_python buildPackages.python3Packages.setuptools ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "This package provides a set of simple math utilities to work with angles. The utilities cover simple things like normalizing an angle and conversion between degrees and radians. But even if you're trying to calculate things like the shortest angular distance between two joint space positions of your robot, but the joint motion is constrained by joint limits, this package is what you need. The code in this package is stable and well tested. There are no plans for major changes in the near future.";
  };
}

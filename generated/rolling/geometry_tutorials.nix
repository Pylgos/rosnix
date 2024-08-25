{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    geometry_tutorials = substituteSource {
      src = fetchgit {
        name = "geometry_tutorials-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "e5a64a1b195d49794093248bdf3f7bdb8d64e50c";
        hash = "sha256-pKGL96jK4+eJOdLsryPMZOhHrsfCeS5TARr8qQeRhPI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometry_tutorials";
  version = "0.6.2-1";
  src = sources.geometry_tutorials;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Metapackage of geometry tutorials ROS.";
  };
}

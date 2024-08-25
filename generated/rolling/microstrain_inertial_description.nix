{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    microstrain_inertial_description = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_description-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "b9ca3aa67ec99327754a8eacf7401c07d193f423";
        hash = "sha256-lOHPxY9ciFC3/2X7J0UY5DTOJATWSsB7GRP81vSSZRU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "microstrain_inertial_description";
  version = "4.3.0-1";
  src = sources.microstrain_inertial_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "URDF and stl files for MicroStrain sensors.";
  };
}
